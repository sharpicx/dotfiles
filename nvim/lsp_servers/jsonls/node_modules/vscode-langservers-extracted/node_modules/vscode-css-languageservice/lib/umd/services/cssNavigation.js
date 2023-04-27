(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "../cssLanguageTypes", "vscode-nls", "../parser/cssNodes", "../parser/cssSymbolScope", "../languageFacts/facts", "../utils/strings", "../utils/resources"], factory);
    }
})(function (require, exports) {
    /*---------------------------------------------------------------------------------------------
     *  Copyright (c) Microsoft Corporation. All rights reserved.
     *  Licensed under the MIT License. See License.txt in the project root for license information.
     *--------------------------------------------------------------------------------------------*/
    'use strict';
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.CSSNavigation = void 0;
    const cssLanguageTypes_1 = require("../cssLanguageTypes");
    const nls = require("vscode-nls");
    const nodes = require("../parser/cssNodes");
    const cssSymbolScope_1 = require("../parser/cssSymbolScope");
    const facts_1 = require("../languageFacts/facts");
    const strings_1 = require("../utils/strings");
    const resources_1 = require("../utils/resources");
    const localize = nls.loadMessageBundle();
    const startsWithSchemeRegex = /^\w+:\/\//;
    const startsWithData = /^data:/;
    class CSSNavigation {
        constructor(fileSystemProvider, resolveModuleReferences) {
            this.fileSystemProvider = fileSystemProvider;
            this.resolveModuleReferences = resolveModuleReferences;
        }
        findDefinition(document, position, stylesheet) {
            const symbols = new cssSymbolScope_1.Symbols(stylesheet);
            const offset = document.offsetAt(position);
            const node = nodes.getNodeAtOffset(stylesheet, offset);
            if (!node) {
                return null;
            }
            const symbol = symbols.findSymbolFromNode(node);
            if (!symbol) {
                return null;
            }
            return {
                uri: document.uri,
                range: getRange(symbol.node, document)
            };
        }
        findReferences(document, position, stylesheet) {
            const highlights = this.findDocumentHighlights(document, position, stylesheet);
            return highlights.map(h => {
                return {
                    uri: document.uri,
                    range: h.range
                };
            });
        }
        findDocumentHighlights(document, position, stylesheet) {
            const result = [];
            const offset = document.offsetAt(position);
            let node = nodes.getNodeAtOffset(stylesheet, offset);
            if (!node || node.type === nodes.NodeType.Stylesheet || node.type === nodes.NodeType.Declarations) {
                return result;
            }
            if (node.type === nodes.NodeType.Identifier && node.parent && node.parent.type === nodes.NodeType.ClassSelector) {
                node = node.parent;
            }
            const symbols = new cssSymbolScope_1.Symbols(stylesheet);
            const symbol = symbols.findSymbolFromNode(node);
            const name = node.getText();
            stylesheet.accept(candidate => {
                if (symbol) {
                    if (symbols.matchesSymbol(candidate, symbol)) {
                        result.push({
                            kind: getHighlightKind(candidate),
                            range: getRange(candidate, document)
                        });
                        return false;
                    }
                }
                else if (node && node.type === candidate.type && candidate.matches(name)) {
                    // Same node type and data
                    result.push({
                        kind: getHighlightKind(candidate),
                        range: getRange(candidate, document)
                    });
                }
                return true;
            });
            return result;
        }
        isRawStringDocumentLinkNode(node) {
            return node.type === nodes.NodeType.Import;
        }
        findDocumentLinks(document, stylesheet, documentContext) {
            const linkData = this.findUnresolvedLinks(document, stylesheet);
            const resolvedLinks = [];
            for (let data of linkData) {
                const link = data.link;
                const target = link.target;
                if (!target || startsWithData.test(target)) {
                    // no links for data:
                }
                else if (startsWithSchemeRegex.test(target)) {
                    resolvedLinks.push(link);
                }
                else {
                    const resolved = documentContext.resolveReference(target, document.uri);
                    if (resolved) {
                        link.target = resolved;
                    }
                    resolvedLinks.push(link);
                }
            }
            return resolvedLinks;
        }
        async findDocumentLinks2(document, stylesheet, documentContext) {
            const linkData = this.findUnresolvedLinks(document, stylesheet);
            const resolvedLinks = [];
            for (let data of linkData) {
                const link = data.link;
                const target = link.target;
                if (!target || startsWithData.test(target)) {
                    // no links for data:
                }
                else if (startsWithSchemeRegex.test(target)) {
                    resolvedLinks.push(link);
                }
                else {
                    const resolvedTarget = await this.resolveRelativeReference(target, document.uri, documentContext, data.isRawLink);
                    if (resolvedTarget !== undefined) {
                        link.target = resolvedTarget;
                        resolvedLinks.push(link);
                    }
                }
            }
            return resolvedLinks;
        }
        findUnresolvedLinks(document, stylesheet) {
            const result = [];
            const collect = (uriStringNode) => {
                let rawUri = uriStringNode.getText();
                const range = getRange(uriStringNode, document);
                // Make sure the range is not empty
                if (range.start.line === range.end.line && range.start.character === range.end.character) {
                    return;
                }
                if ((0, strings_1.startsWith)(rawUri, `'`) || (0, strings_1.startsWith)(rawUri, `"`)) {
                    rawUri = rawUri.slice(1, -1);
                }
                const isRawLink = uriStringNode.parent ? this.isRawStringDocumentLinkNode(uriStringNode.parent) : false;
                result.push({ link: { target: rawUri, range }, isRawLink });
            };
            stylesheet.accept(candidate => {
                if (candidate.type === nodes.NodeType.URILiteral) {
                    const first = candidate.getChild(0);
                    if (first) {
                        collect(first);
                    }
                    return false;
                }
                /**
                 * In @import, it is possible to include links that do not use `url()`
                 * For example, `@import 'foo.css';`
                 */
                if (candidate.parent && this.isRawStringDocumentLinkNode(candidate.parent)) {
                    const rawText = candidate.getText();
                    if ((0, strings_1.startsWith)(rawText, `'`) || (0, strings_1.startsWith)(rawText, `"`)) {
                        collect(candidate);
                    }
                    return false;
                }
                return true;
            });
            return result;
        }
        findDocumentSymbols(document, stylesheet) {
            const result = [];
            stylesheet.accept((node) => {
                const entry = {
                    name: null,
                    kind: cssLanguageTypes_1.SymbolKind.Class,
                    location: null
                };
                let locationNode = node;
                if (node instanceof nodes.Selector) {
                    entry.name = node.getText();
                    locationNode = node.findAParent(nodes.NodeType.Ruleset, nodes.NodeType.ExtendsReference);
                    if (locationNode) {
                        entry.location = cssLanguageTypes_1.Location.create(document.uri, getRange(locationNode, document));
                        result.push(entry);
                    }
                    return false;
                }
                else if (node instanceof nodes.VariableDeclaration) {
                    entry.name = node.getName();
                    entry.kind = cssLanguageTypes_1.SymbolKind.Variable;
                }
                else if (node instanceof nodes.MixinDeclaration) {
                    entry.name = node.getName();
                    entry.kind = cssLanguageTypes_1.SymbolKind.Method;
                }
                else if (node instanceof nodes.FunctionDeclaration) {
                    entry.name = node.getName();
                    entry.kind = cssLanguageTypes_1.SymbolKind.Function;
                }
                else if (node instanceof nodes.Keyframe) {
                    entry.name = localize('literal.keyframes', "@keyframes {0}", node.getName());
                }
                else if (node instanceof nodes.FontFace) {
                    entry.name = localize('literal.fontface', "@font-face");
                }
                else if (node instanceof nodes.Media) {
                    const mediaList = node.getChild(0);
                    if (mediaList instanceof nodes.Medialist) {
                        entry.name = '@media ' + mediaList.getText();
                        entry.kind = cssLanguageTypes_1.SymbolKind.Module;
                    }
                }
                if (entry.name) {
                    entry.location = cssLanguageTypes_1.Location.create(document.uri, getRange(locationNode, document));
                    result.push(entry);
                }
                return true;
            });
            return result;
        }
        findDocumentColors(document, stylesheet) {
            const result = [];
            stylesheet.accept((node) => {
                const colorInfo = getColorInformation(node, document);
                if (colorInfo) {
                    result.push(colorInfo);
                }
                return true;
            });
            return result;
        }
        getColorPresentations(document, stylesheet, color, range) {
            const result = [];
            const red256 = Math.round(color.red * 255), green256 = Math.round(color.green * 255), blue256 = Math.round(color.blue * 255);
            let label;
            if (color.alpha === 1) {
                label = `rgb(${red256}, ${green256}, ${blue256})`;
            }
            else {
                label = `rgba(${red256}, ${green256}, ${blue256}, ${color.alpha})`;
            }
            result.push({ label: label, textEdit: cssLanguageTypes_1.TextEdit.replace(range, label) });
            if (color.alpha === 1) {
                label = `#${toTwoDigitHex(red256)}${toTwoDigitHex(green256)}${toTwoDigitHex(blue256)}`;
            }
            else {
                label = `#${toTwoDigitHex(red256)}${toTwoDigitHex(green256)}${toTwoDigitHex(blue256)}${toTwoDigitHex(Math.round(color.alpha * 255))}`;
            }
            result.push({ label: label, textEdit: cssLanguageTypes_1.TextEdit.replace(range, label) });
            const hsl = (0, facts_1.hslFromColor)(color);
            if (hsl.a === 1) {
                label = `hsl(${hsl.h}, ${Math.round(hsl.s * 100)}%, ${Math.round(hsl.l * 100)}%)`;
            }
            else {
                label = `hsla(${hsl.h}, ${Math.round(hsl.s * 100)}%, ${Math.round(hsl.l * 100)}%, ${hsl.a})`;
            }
            result.push({ label: label, textEdit: cssLanguageTypes_1.TextEdit.replace(range, label) });
            const hwb = (0, facts_1.hwbFromColor)(color);
            if (hwb.a === 1) {
                label = `hwb(${hwb.h} ${Math.round(hwb.w * 100)}% ${Math.round(hwb.b * 100)}%)`;
            }
            else {
                label = `hwb(${hwb.h} ${Math.round(hwb.w * 100)}% ${Math.round(hwb.b * 100)}% / ${hwb.a})`;
            }
            result.push({ label: label, textEdit: cssLanguageTypes_1.TextEdit.replace(range, label) });
            return result;
        }
        doRename(document, position, newName, stylesheet) {
            const highlights = this.findDocumentHighlights(document, position, stylesheet);
            const edits = highlights.map(h => cssLanguageTypes_1.TextEdit.replace(h.range, newName));
            return {
                changes: { [document.uri]: edits }
            };
        }
        async resolveModuleReference(ref, documentUri, documentContext) {
            if ((0, strings_1.startsWith)(documentUri, 'file://')) {
                const moduleName = getModuleNameFromPath(ref);
                const rootFolderUri = documentContext.resolveReference('/', documentUri);
                const documentFolderUri = (0, resources_1.dirname)(documentUri);
                const modulePath = await this.resolvePathToModule(moduleName, documentFolderUri, rootFolderUri);
                if (modulePath) {
                    const pathWithinModule = ref.substring(moduleName.length + 1);
                    return (0, resources_1.joinPath)(modulePath, pathWithinModule);
                }
            }
            return undefined;
        }
        async resolveRelativeReference(ref, documentUri, documentContext, isRawLink) {
            const relativeReference = documentContext.resolveReference(ref, documentUri);
            // Following [css-loader](https://github.com/webpack-contrib/css-loader#url)
            // and [sass-loader's](https://github.com/webpack-contrib/sass-loader#imports)
            // convention, if an import path starts with ~ then use node module resolution
            // *unless* it starts with "~/" as this refers to the user's home directory.
            if (ref[0] === '~' && ref[1] !== '/' && this.fileSystemProvider) {
                ref = ref.substring(1);
                return await this.resolveModuleReference(ref, documentUri, documentContext) || relativeReference;
            }
            // Following [less-loader](https://github.com/webpack-contrib/less-loader#imports)
            // and [sass-loader's](https://github.com/webpack-contrib/sass-loader#resolving-import-at-rules)
            // new resolving import at-rules (~ is deprecated). The loader will first try to resolve @import as a relative path. If it cannot be resolved, 
            // then the loader will try to resolve @import inside node_modules.
            if (this.resolveModuleReferences) {
                if (relativeReference && await this.fileExists(relativeReference)) {
                    return relativeReference;
                }
                else {
                    return await this.resolveModuleReference(ref, documentUri, documentContext) || relativeReference;
                }
            }
            return relativeReference;
        }
        async resolvePathToModule(_moduleName, documentFolderUri, rootFolderUri) {
            // resolve the module relative to the document. We can't use `require` here as the code is webpacked.
            const packPath = (0, resources_1.joinPath)(documentFolderUri, 'node_modules', _moduleName, 'package.json');
            if (await this.fileExists(packPath)) {
                return (0, resources_1.dirname)(packPath);
            }
            else if (rootFolderUri && documentFolderUri.startsWith(rootFolderUri) && (documentFolderUri.length !== rootFolderUri.length)) {
                return this.resolvePathToModule(_moduleName, (0, resources_1.dirname)(documentFolderUri), rootFolderUri);
            }
            return undefined;
        }
        async fileExists(uri) {
            if (!this.fileSystemProvider) {
                return false;
            }
            try {
                const stat = await this.fileSystemProvider.stat(uri);
                if (stat.type === cssLanguageTypes_1.FileType.Unknown && stat.size === -1) {
                    return false;
                }
                return true;
            }
            catch (err) {
                return false;
            }
        }
    }
    exports.CSSNavigation = CSSNavigation;
    function getColorInformation(node, document) {
        const color = (0, facts_1.getColorValue)(node);
        if (color) {
            const range = getRange(node, document);
            return { color, range };
        }
        return null;
    }
    function getRange(node, document) {
        return cssLanguageTypes_1.Range.create(document.positionAt(node.offset), document.positionAt(node.end));
    }
    function getHighlightKind(node) {
        if (node.type === nodes.NodeType.Selector) {
            return cssLanguageTypes_1.DocumentHighlightKind.Write;
        }
        if (node instanceof nodes.Identifier) {
            if (node.parent && node.parent instanceof nodes.Property) {
                if (node.isCustomProperty) {
                    return cssLanguageTypes_1.DocumentHighlightKind.Write;
                }
            }
        }
        if (node.parent) {
            switch (node.parent.type) {
                case nodes.NodeType.FunctionDeclaration:
                case nodes.NodeType.MixinDeclaration:
                case nodes.NodeType.Keyframe:
                case nodes.NodeType.VariableDeclaration:
                case nodes.NodeType.FunctionParameter:
                    return cssLanguageTypes_1.DocumentHighlightKind.Write;
            }
        }
        return cssLanguageTypes_1.DocumentHighlightKind.Read;
    }
    function toTwoDigitHex(n) {
        const r = n.toString(16);
        return r.length !== 2 ? '0' + r : r;
    }
    function getModuleNameFromPath(path) {
        // If a scoped module (starts with @) then get up until second instance of '/', otherwise get until first instance of '/'
        if (path[0] === '@') {
            return path.substring(0, path.indexOf('/', path.indexOf('/') + 1));
        }
        return path.substring(0, path.indexOf('/'));
    }
});
