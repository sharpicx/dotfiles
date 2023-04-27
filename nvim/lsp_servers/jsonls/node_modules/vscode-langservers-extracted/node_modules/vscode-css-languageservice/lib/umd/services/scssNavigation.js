(function (factory) {
    if (typeof module === "object" && typeof module.exports === "object") {
        var v = factory(require, exports);
        if (v !== undefined) module.exports = v;
    }
    else if (typeof define === "function" && define.amd) {
        define(["require", "exports", "./cssNavigation", "../parser/cssNodes", "vscode-uri", "../utils/strings"], factory);
    }
})(function (require, exports) {
    /*---------------------------------------------------------------------------------------------
     *  Copyright (c) Microsoft Corporation. All rights reserved.
     *  Licensed under the MIT License. See License.txt in the project root for license information.
     *--------------------------------------------------------------------------------------------*/
    'use strict';
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.SCSSNavigation = void 0;
    const cssNavigation_1 = require("./cssNavigation");
    const nodes = require("../parser/cssNodes");
    const vscode_uri_1 = require("vscode-uri");
    const strings_1 = require("../utils/strings");
    class SCSSNavigation extends cssNavigation_1.CSSNavigation {
        constructor(fileSystemProvider) {
            super(fileSystemProvider, true);
        }
        isRawStringDocumentLinkNode(node) {
            return (super.isRawStringDocumentLinkNode(node) ||
                node.type === nodes.NodeType.Use ||
                node.type === nodes.NodeType.Forward);
        }
        async resolveRelativeReference(ref, documentUri, documentContext, isRawLink) {
            if ((0, strings_1.startsWith)(ref, 'sass:')) {
                return undefined; // sass library
            }
            const target = await super.resolveRelativeReference(ref, documentUri, documentContext, isRawLink);
            if (this.fileSystemProvider && target && isRawLink) {
                const parsedUri = vscode_uri_1.URI.parse(target);
                try {
                    const pathVariations = toPathVariations(parsedUri);
                    if (pathVariations) {
                        for (let j = 0; j < pathVariations.length; j++) {
                            if (await this.fileExists(pathVariations[j])) {
                                return pathVariations[j];
                            }
                        }
                    }
                }
                catch (e) {
                    // ignore
                }
            }
            return target;
            function toPathVariations(uri) {
                // No valid path
                if (uri.path === '') {
                    return undefined;
                }
                // No variation for links that ends with suffix
                if (uri.path.endsWith('.scss') || uri.path.endsWith('.css')) {
                    return undefined;
                }
                // If a link is like a/, try resolving a/index.scss and a/_index.scss
                if (uri.path.endsWith('/')) {
                    return [
                        uri.with({ path: uri.path + 'index.scss' }).toString(),
                        uri.with({ path: uri.path + '_index.scss' }).toString()
                    ];
                }
                // Use `uri.path` since it's normalized to use `/` in all platforms
                const pathFragments = uri.path.split('/');
                const basename = pathFragments[pathFragments.length - 1];
                const pathWithoutBasename = uri.path.slice(0, -basename.length);
                // No variation for links such as _a
                if (basename.startsWith('_')) {
                    if (uri.path.endsWith('.scss')) {
                        return undefined;
                    }
                    else {
                        return [uri.with({ path: uri.path + '.scss' }).toString()];
                    }
                }
                const normalizedBasename = basename + '.scss';
                const documentUriWithBasename = (newBasename) => {
                    return uri.with({ path: pathWithoutBasename + newBasename }).toString();
                };
                const normalizedPath = documentUriWithBasename(normalizedBasename);
                const underScorePath = documentUriWithBasename('_' + normalizedBasename);
                const indexPath = documentUriWithBasename(normalizedBasename.slice(0, -5) + '/index.scss');
                const indexUnderscoreUri = documentUriWithBasename(normalizedBasename.slice(0, -5) + '/_index.scss');
                const cssPath = documentUriWithBasename(normalizedBasename.slice(0, -5) + '.css');
                return [normalizedPath, underScorePath, indexPath, indexUnderscoreUri, cssPath];
            }
        }
    }
    exports.SCSSNavigation = SCSSNavigation;
});
