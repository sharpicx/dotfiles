vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1,
}
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "!",
        staged = "+",
        unmerged = "",
        renamed = "➜",
        untracked = "?",
        deleted = "",
        ignored = "◌",
    },
    folder = {
        arrow_open = "",
        arrow_closed = "",
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = "",
        symlink_open = "",
    },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")

if not status_ok then
    return
end

local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")

if not config_status_ok then
    return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
    hide_root_folder = true,
    open_on_setup = true,
    open_on_tab = true,
    sort_by = "name",
    update_cwd = false,
    auto_reload_on_write = true,
    disable_netrw = true,
    hijack_cursor = true,
    view = {
        width = 40,
        height = 40,
        side = "left",
        signcoloumn = "yes",
        mappings = {
            list = {
                { key = "s", cb = tree_cb("vsplit") },
                { key = "z", cb = tree_cb("") },
                { key = "m", cb = tree_cb("") },
            },
        },
    },
    renderer = { indent_markers = { enable = true } },
    filters = { custom = { ".git/", "node_modules" } },
    actions = {
        open_file = {
            window_picker = {
                exclude = {
                    filetype = {
                        "notify",
                        "packer",
                        "qf",
                        "diff",
                        "fugitive",
                        "fugitiveblame",
                    },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})
