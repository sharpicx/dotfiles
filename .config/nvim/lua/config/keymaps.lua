local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Alpha
keymap("n", "<leader>a", ":Alpha<CR>", opts)

-- buffer
keymap("n", "m", ":bnext<CR>", opts)
keymap("n", "z", ":bprevious<CR>", opts)

keymap("n", "<A-m>", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<A-n>", ":BufferLineMovePrev<CR>", opts)

keymap("n", "<C-p>", ":BufferLineTogglePin<CR>", opts)
-- Delete current buffer
keymap("n", "<leader>bd", ":bd!<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", "\"_dP", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "tff", ":Telescope find_files hidden=true no_ignore=true<CR>", opts)
-- keymap(
--     "n",
--     "tfv",
--     ":Telescope find_files preview=true hidden=true no_ignore=true<CR>",
--     opts
-- )
keymap("n", "tfg", ":Telescope live_grep preview=true<CR>", opts)
keymap(
    "n",
    "<space>fb",
    ":Telescope file_browser preview=true<CR>",
    { noremap = true }
)
keymap(
    "n",
    "<space>mf",
    ":Telescope media_files preview=true<CR>",
    { noremap = true }
)
keymap(
    "n",
    "<space>tb",
    ":Telescope buffers preview=true<CR>",
    { noremap = true }
)

-- Nvim Tree
keymap("n", "<C-n>", ":NvimTreeFindFileToggle<CR>", opts)
vim.cmd([[tnoremap <silent> <C-n> <C-\><C-n>:NvimTreeToggle<CR>]])
keymap("n", "<leader>r", ":NvimTreeRefresh<CR>", opts)

-- nohlsearch
keymap("n", "<Leader>nh", ":nohlsearch<CR>", opts)

-- Toogle terminal
vim.cmd([[nnoremap <silent> <A-d> :ToggleTerm<CR>]])
vim.cmd([[tnoremap <silent> <A-d> <C-\><C-n>:ToggleTerm<CR>]])

-- Trouble
vim.api.nvim_set_keymap(
    "n",
    "<leader>xx",
    "<cmd>Trouble<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xw",
    "<cmd>Trouble workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xd",
    "<cmd>Trouble document_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xl",
    "<cmd>Trouble loclist<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "<leader>xq",
    "<cmd>Trouble quickfix<cr>",
    { silent = true, noremap = true }
)
vim.api.nvim_set_keymap(
    "n",
    "gR",
    "<cmd>Trouble lsp_references<cr>",
    { silent = true, noremap = true }
)
