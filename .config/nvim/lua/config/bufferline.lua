local status_ok, bufferline = pcall(require, "bufferline")

if not status_ok then
    return
end

bufferline.setup({
    options = {
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
        separator_style = 'thick',
        max_name_length = 18,
        max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
        tab_size = 20,
        show_close_icon = false,
        show_buffer_close_icons = false,
        show_buffer_icons = true,
    },
    highlights = {
        buffer_selected = { gui = "NONE" },
        diagnostic_selected = { gui = "bold" },
        info_selected = { gui = "bold" },
        info_diagnostic_selected = { gui = "bold" },
        warning_selected = { gui = "bold" },
        warning_diagnostic_selected = { gui = "bold" },
        error_selected = { gui = "bold" },
        error_diagnostic_selected = { gui = "bold" },
        duplicate_selected = { gui = "bold" },
        duplicate_visible = { gui = "bold" },
        duplicate = { gui = "bold" },
        pick_selected = { gui = "bold" },
        pick_visible = { gui = "bold" },
        pick = { gui = "bold" },
    },
})
