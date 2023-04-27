local status_ok, lualine = pcall(require, "lualine")

if not status_ok then
    return
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = 'auto',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        disabled_filetypes = {
            "NvimTree",
            "Packer",
            "ToggleTerm",
            "lsp-installer",
            "alpha",
            "dashboard",
        },
        globalstatus = false,
        always_divided_middle = true,
        padding = 1,
    },
    sections = {
        lualine_a = { 
            { 
                "mode", 
                icons_enabled = true, 
                icon = nil, 
                separator = nil, 
                cond = nil, 
                type = nil, 
                padding = 1, 
                fmt = nil, 
            }, 
        },
        lualine_b = {
            { "branch", icon = "" },
            { "diff" },
            {
                "diagnostics",
                symbols = {
                    error = " ",
                    warn = " ",
                    info = " ",
                    hint = " ",
                },
            },
        },
        lualine_c = { {
                "filename", 
                modified = ' [+]',
                readonly = ' [-]',
                unnamed = ' [No Name]',
            },
            {
                  "data", 
            }, 
            { 
                "require'lsp-status'.status()" 
            },
        },
        lualine_x = { 
            {
                "encoding",
            },
            {
                "fileformat",
            },
            {
                "filetype",
                colored = true,
                TelescopePrompt = 'Telescope',
                dashboard = 'Dashboard',
                packer = 'Packer',
                fzf = 'FZF',
                alpha = 'Alpha',
            },
        },
        lualine_y = { 
        -- {         
             --"buffers",
            --    show_filename_only = true,
            --    hide_filename_extension = true,
            --   show_modified_status = true,
            --    mode = 0,
        --}
            {
                "progress",
            },
            {
                "location",
            },
        },
        lualine_z = { "os.date('%A, %H:%M')", "hostname" },
    },
    tabline = {},
    extensions = {}
})
