require("_keymaps")
require("_inlay_hints")
require("_plugins")
require("_auto_complete")
require("_autopairs")
require("_mason")
require("_telescope")
require("_treesitter")
require("_comment")
require("_gitsigns")
require("_nvim_tree")
require("_bufferline")
require("_null_ls")
require("_lualine")
require("_toggleterm")
require("_alpha")
require("_lastplace")
require("_transparent")
require("_indentline")
require("_leap")
require("_rust_tools")
require("_inlay_hints")
require("_options")

vim.cmd("colorscheme dracula")
vim.cmd("hi! link LspVariableReadOnly DraculaPurple")
vim.cmd("hi! link LspFunction DraculaGreen")
vim.cmd("hi! link LspMember DraculaGreen")
vim.cmd("hi! link LspNamespace DraculaCyan")
vim.cmd("hi! link LspNamespaceDeclaration DraculaCyan")
vim.cmd("hi! link LspProperty  Identifier")
vim.cmd("hi! link LspEnumMember Identifier")
vim.cmd("hi! link LspClass DraculaCyan")
vim.cmd("hi! link LspOperator DraculaPink")
vim.cmd("hi! link @constructor.imported Identifier")
vim.cmd("hi! link @namespace.imported Identifier")
vim.cmd("hi! link @namespace.exported Identifier")
vim.cmd("hi! link @variable.imported.specifier Identifier")
vim.cmd("hi! link @operator.module DraculaPurple")
vim.cmd("hi! link @constructor.jsx DraculaCyanItalic")
vim.cmd("hi! link @field Identifier")
vim.cmd("hi! link LspInlayHint DraculaComment")
vim.cmd("hi! link @comment DraculaRed")

vim.cmd("hi! link LspParameter  DraculaFg")
vim.cmd("highlight link @class DraculaCyan")
vim.cmd("highlight link @type.qualifier DraculaPink")
vim.cmd("highlight link @property DraculaOrange")
vim.cmd("highlight link @parameter DraculaFg")
vim.cmd("highlight link @variable.builtin DraculaPurpleItalic")
vim.cmd("highlight link @namespace DraculaPink")
vim.cmd("highlight link @function.macro DraculaGreen")

local notify = vim.notify
vim.notify = function(msg, ...)
	if msg:match("warning: multiple different client offset_encodings") then
		return
	end

	notify(msg, ...)
end





--[[ local ok, lsp_inlayhints = pcall(require, "lsp-inlayhints") ]]
--[[ if ok then ]]
--[[     lsp_inlayhints.setup() ]]
--[[     print("inlay hints") ]]
--[[ end ]]
