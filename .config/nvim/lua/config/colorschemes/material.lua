local status_ok, material = pcall(require, "material")

if not status_ok then
    return
end

vim.g.material_style = "deep ocean"

local colors = require("material.colors")

local nvimtree = true

material.setup({
    contrast = {
        sidebars = nvimtree,
        floating_windows = true,
        line_numbers = false,
        pop_menu = true,

    },
    italics = {
        comments = true,
        keywords = true,
    },
    custom_highlights = {
        NvimTreeVertSplit = {
            bg = nvimtree and colors.contrast or colors.sidebar,
        },
        NvimTreeStatusline = {
            bg = nvimtree and "#010108",
        },
        NvimTreeStatuslineNc = {
            bg = nvimtree and colors.contrast or colors.sidebar,
        },
    },
})

vim.cmd("colorscheme material")
