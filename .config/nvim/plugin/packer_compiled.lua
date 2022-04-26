-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/via/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/via/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/via/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/via/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/via/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["AutoSave.nvim"] = {
    config = { "require('config.autosave')" },
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/AutoSave.nvim",
    url = "https://github.com/Pocco81/AutoSave.nvim"
  },
  LuaSnip = {
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["SchemaStore.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["alpha-nvim"] = {
    config = { "require('config.alpha')" },
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["bufferline.nvim"] = {
    config = { "require('config.bufferline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/via/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["formatter.nvim"] = {
    commands = { "Format", "FormatWrite" },
    config = { "require('config.formatter')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config.gitsigns')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('config.indent-blankline')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  kommentary = {
    config = { "require('config.kommentary')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/kommentary",
    url = "https://github.com/b3nj5m1n/kommentary"
  },
  ["lualine.nvim"] = {
    config = { "require('config.lualine')" },
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["material.nvim"] = {
    config = { "require('config.colorschemes.material')" },
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/material.nvim",
    url = "https://github.com/marko-cerovac/material.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('config.autopairs')" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-path", "cmp-nvim-lua", "cmp_luasnip", "nvim-autopairs", "cmp-buffer" },
    config = { "require('config.cmp')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('config.colorizer')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    after = { "nvim-lspconfig", "cmp-nvim-lsp" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nM\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\27config.symbols-outline\15config.lsp\frequire\0" },
    load_after = {
      ["nvim-lsp-installer"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    commands = { "NvimTreeFindFileToggle" },
    config = { "require('config.nvim-tree')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('config.treesitter')" },
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/via/.local/share/nvim/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('config.telescope')" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    commands = { "ToggleTerm" },
    config = { "require('config.toggleterm')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    commands = { "Trouble" },
    config = { "require('config.trouble')" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/via/.local/share/nvim/site/pack/packer/opt/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: material.nvim
time([[Config for material.nvim]], true)
require('config.colorschemes.material')
time([[Config for material.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('config.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
require('config.alpha')
time([[Config for alpha-nvim]], false)
-- Config for: AutoSave.nvim
time([[Config for AutoSave.nvim]], true)
require('config.autosave')
time([[Config for AutoSave.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('config.lualine')
time([[Config for lualine.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FormatWrite lua require("packer.load")({'formatter.nvim'}, { cmd = "FormatWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ToggleTerm lua require("packer.load")({'toggleterm.nvim'}, { cmd = "ToggleTerm", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file NvimTreeFindFileToggle lua require("packer.load")({'nvim-tree.lua'}, { cmd = "NvimTreeFindFileToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Trouble lua require("packer.load")({'trouble.nvim'}, { cmd = "Trouble", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Format lua require("packer.load")({'formatter.nvim'}, { cmd = "Format", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType typescriptreact ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "typescriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType asm ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "asm" }, _G.packer_plugins)]]
vim.cmd [[au FileType gomod ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "gomod" }, _G.packer_plugins)]]
vim.cmd [[au FileType hercules ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "hercules" }, _G.packer_plugins)]]
vim.cmd [[au FileType jproperties ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "jproperties" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType c ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "c" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'SchemaStore.nvim', 'indent-blankline.nvim'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType conf ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { ft = "conf" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType yaml ++once lua require("packer.load")({'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { ft = "yaml" }, _G.packer_plugins)]]
vim.cmd [[au FileType NvimTree ++once lua require("packer.load")({'nvim-web-devicons'}, { ft = "NvimTree" }, _G.packer_plugins)]]
vim.cmd [[au FileType TelescopePrompt ++once lua require("packer.load")({'nvim-web-devicons'}, { ft = "TelescopePrompt" }, _G.packer_plugins)]]
vim.cmd [[au FileType cmd ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "cmd" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'indent-blankline.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType go ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "go" }, _G.packer_plugins)]]
vim.cmd [[au FileType jsonc ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'nvim-colorizer.lua', 'SchemaStore.nvim', 'indent-blankline.nvim'}, { ft = "jsonc" }, _G.packer_plugins)]]
vim.cmd [[au FileType cpp ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "cpp" }, _G.packer_plugins)]]
vim.cmd [[au FileType cs ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "cs" }, _G.packer_plugins)]]
vim.cmd [[au FileType dockerfile ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "dockerfile" }, _G.packer_plugins)]]
vim.cmd [[au FileType java ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "java" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascriptreact ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "javascriptreact" }, _G.packer_plugins)]]
vim.cmd [[au FileType kotlin ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "kotlin" }, _G.packer_plugins)]]
vim.cmd [[au FileType php ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "php" }, _G.packer_plugins)]]
vim.cmd [[au FileType python ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "python" }, _G.packer_plugins)]]
vim.cmd [[au FileType ruby ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "ruby" }, _G.packer_plugins)]]
vim.cmd [[au FileType rust ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
vim.cmd [[au FileType sql ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "sql" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-lsp-installer', 'kommentary', 'nvim-ts-rainbow', 'bufferline.nvim', 'indent-blankline.nvim'}, { ft = "typescript" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufRead * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'LuaSnip', 'nvim-cmp'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
