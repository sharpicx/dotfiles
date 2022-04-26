local status_ok, kommentary_config = pcall(require, "kommentary.config")

if not status_ok then
    return
end

kommentary_config.configure_language(
    "default",
    { prefer_single_line_comments = true }
)

kommentary_config.use_extended_mappings()
