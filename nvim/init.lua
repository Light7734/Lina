require("_options")
require("_keymaps")
require("_plugins")
require("_auto_complete")
require("_lsp")
require("_telescope")
require("_treesitter")
require("_comment")
require("_gitsigns")
require("_nvim_tree")
-- require("_bufferline")
require("_null_ls")
require("_lualine")
require("_toggleterm")
require("_alpha")
require("_lastplace")
require("_transparent")
require("_indentline")

vim.cmd("colorscheme dracula")

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.autoindent = true

vim.cmd('let g:neovide_cursor_vfx_mode = "pixiedust"')
vim.cmd("let g:neovide_cursor_vfx_particle_density = 8.0")
