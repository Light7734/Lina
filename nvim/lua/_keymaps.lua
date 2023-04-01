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

		require("lsp-inlayhints").toggle()
	else
		ZenActive = false

		vim.cmd("set showtabline=2")
		vim.cmd("set relativenumber")
		vim.cmd("set number")

		require("lsp-inlayhints").toggle()
	end
end

vim.api.nvim_create_user_command("ToggleZen", toggle_zen, {})

keymap("n", "<C-q>", "<cmd>ToggleZen<cr>", opts)

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

keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<A-j>", ":move +1<CR>", opts)
keymap("n", "<A-k>", ":move -2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "p", '"_dP', opts)

keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Move text up and down
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

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
keymap("n", "<leader>tg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", opts)
keymap("n", "<leader>nvt", "<cmd>NvimTreeFindFile<cr>", opts)
keymap("n", "<leader>w", "<cmd>w<cr>", opts)

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
--[[ keymap( ]]
--[[ 	"n", ]]
--[[ 	"<C-->", ]]
--[[ 	":luado vim.g.font_size = vim.g.font_size - 1; vim.o.guifont='Consolas:h'..vim.g.font_size<CR>", ]]
--[[ 	opts ]]
--[[ ) ]]
--[[ keymap( ]]
--[[ 	"n", ]]
--[[ 	"<C-+>", ]]
--[[ 	":luado vim.g.font_size = vim.g.font_size + 1; vim.o.guifont='Consolas:h'..vim.g.font_size<CR>", ]]
--[[ 	opts ]]
--[[ ) ]]
keymap("n", "\\", "<cmd>ToggleTerm<cr>", opts)
--[[ 	"<C-+>", ]]
--[[ 	":luado vim.g.font_size = vim.g.font_size + 1; vim.o.guifont='Consolas:h'..vim.g.font_size<CR>", ]]
--[[ 	opts ]]
--[[ ) ]]
keymap("n", "\\", "<cmd>ToggleTerm<cr>", opts)
--[[ ) ]]
keymap("n", "\\", "<cmd>ToggleTerm<cr>", opts)
--[[ 	":luado vim.g.font_size = vim.g.font_size + 1; vim.o.guifont='Consolas:h'..vim.g.font_size<CR>", ]]
--[[ 	opts ]]
--[[ ) ]]
keymap("n", "\\", "<cmd>ToggleTerm<cr>", opts)
--[[ ) ]]
keymap("n", "\\", "<cmd>ToggleTerm<cr>", opts)
