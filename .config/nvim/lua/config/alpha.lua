local status_ok, alpha = pcall(require, "alpha")

if not status_ok then
    return
end

local dashboard = require("alpha.themes.dashboard")

--dashboard.section.header.val = {
--    [[ ██████   █████                                ███                 ]],
--    [[░░██████ ░░███                                ░░░                  ]],
--    [[ ░███░███ ░███   ██████   ██████  █████ █████ ████  █████████████  ]],
--    [[ ░███░░███░███  ███░░███ ███░░███░░███ ░░███ ░░███ ░░███░░███░░███ ]],
--    [[ ░███ ░░██████ ░███████ ░███ ░███ ░███  ░███  ░███  ░███ ░███ ░███ ]],
--    [[ ░███  ░░█████ ░███░░░  ░███ ░███ ░░███ ███   ░███  ░███ ░███ ░███ ]],
--    [[ █████  ░░█████░░██████ ░░██████   ░░█████    █████ █████░███ █████]],
--    [[░░░░░    ░░░░░  ░░░░░░   ░░░░░░     ░░░░░    ░░░░░ ░░░░░ ░░░ ░░░░░ ]],
--}

dashboard.section.header.val = {
[[     _                         _]],
[[    |_|                       |_|]],
[[    | |         /^^^\         | |]],
[[   _| |_      (| "o" |)      _| |_]],
[[ _| | | | _    (_---_)    _ | | | |_ ]],
[[| | | | |' |    _| |_    | `| | | | |]],
[[\          /   /     \   \          /]],
[[ \        /  / /(. .)\ \  \        /]],
[[  \    /  / /  | . |  \ \  \    /]],
[[     \  \/ /    ||Y||    \ \/  /]],
[[       \_/      || ||      \_/]],
[[                () ()]],
[[                || ||]],
[[               ooO Ooo]],
[[              sharpicx           ]]
}


dashboard.section.buttons.val = {
    dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button(
        "tff",
        "  Find file",
        ":Telescope find_files hidden=true no_ignore=true<CR>"
    ),
    -- dashboard.button(
    --     "tfv",
    --     "  Find file with preview",
    --     ":Telescope find_files preview=true hidden=true no_ignore=true<CR>"
    -- ),
    dashboard.button(
        "tfg",
        "  Live grep",
        ":Telescope live_grep preview=true<CR>"
    ),
    dashboard.button(
        "<space>fb",
        "  File browser",
        ":Telescope file_browser preview=true<CR>"
    ),
    dashboard.button(
        "<space>mf",
        "  Media files",
        ":Telescope media_files preview=true<CR>"
    ),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

dashboard.config.opts.noautocmd = true

alpha.setup(dashboard.config)
