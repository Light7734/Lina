local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local keymap = vim.api.nvim_set_keymap

-- Set leader to space
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

ZenActive = true

local function toggle_zen()
    if not ZenActive then
        ZenActive = true

        vim.cmd("set showtabline=0")
        vim.cmd("set nonumber")
        vim.cmd("set norelativenumber")
    else
        ZenActive = false

        vim.cmd("set showtabline=2")
        vim.cmd("set relativenumber")
        vim.cmd("set number")
    end
end

vim.api.nvim_create_user_command("ToggleZen", toggle_zen, {})

keymap("n", "<C-q>", "<cmd>ToggleZen<cr>", opts)
keymap("n", "<leader>h", "<cmd>nohl<cr>", opts)

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-c>", "<CMD>%bd|e#|bd#<CR>", opts)


keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

-- Move text up and down
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

keymap(
    "n",
    "<leader>tm",
    "<cmd>lua require 'telescope.builtin'.lsp_document_symbols({ symbols = { 'method', 'function' } })<cr>",
    opts
)

keymap(
    "n",
    "<leader>tf",
    "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<cr>",
    opts
)
keymap(
    "n",
    "<leader>tt",
    "<cmd>lua require'telescope.builtin'.find_files({theme = require('telescope.themes').get_dropdown({ previewer = false }), cwd='./tests'})<cr>",
    opts
)
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)


keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>w", "<cmd>w<cr>", opts)
keymap("n", "<leader>c", "<cmd>bdelete<cr>", opts)

keymap(
    "n",
    "<A-]>",
    [[<cmd>set so=999<cr> <cmd>/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/<cr>jjj^0 <cmd>nohl<cr> <cmd>set so=6<cr>]],
    opts
)

keymap(
    "n",
    "<A-[>",
    [[<cmd>set so=999<cr> <cmd>?\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/<cr>nnjjj^0 <cmd>nohl<cr> <cmd>set so=6<cr>]],
    opts
)

vim.g.font_size = 10
vim.o.guifont = "JetbrainsMono Nerd Font:h" .. vim.g.font_size

keymap("n", "<C-e>", "5<C-e>", opts)

vim.keymap.set(
    "n",
    "<C-_>",
    [[<cmd>lua vim.g.font_size = vim.g.font_size - 1<CR><cmd>lua vim.o.guifont='JetbrainsMono Nerd Font:h'..vim.g.font_size<CR>]]
)

vim.keymap.set(
    "n",
    "<C-+>",
    [[<cmd>lua vim.g.font_size = vim.g.font_size + 1<CR><cmd>lua vim.o.guifont='JetbrainsMono Nerd Font:h'..vim.g.font_size<CR>]]
)
keymap("n", "\\", "<cmd>ToggleTerm<cr>", opts)
keymap("t", "<leader>\\", "<cmd>ToggleTerm<cr>", opts)

vim.api.nvim_set_keymap(
    "v",
    "<leader>re",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
    { noremap = true, silent = true, expr = false }
)

vim.api.nvim_set_keymap(
    "v",
    "<leader>rf",
    [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
    { noremap = true, silent = true, expr = false }
)
