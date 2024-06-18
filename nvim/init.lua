require("_options")

require("_plugins")
require("_keymaps")
require("_inlay_hints")
require("_autopairs")
require("_auto_complete")
require("_telescope")

require("_treesitter")
require("_comment")
require("_gitsigns")
require("_nvim_tree")
require("_lualine")
require("_toggleterm")
require("_alpha")
require("_lastplace")
require("_transparent")
require("_leap")
require("_inlay_hints")
require("_lsp_zero")

require("_mason")

require("gruvbox").setup({
    overrides = {
        SignColumn = { bg = "#282828" }
    },
})

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])

--[[ local ok, lsp_inlayhints = pcall(require, "lsp-inlayhints") ]]
--[[ if ok then ]]
--[[     lsp_inlayhints.setup() ]]
--[[     print("inlay hints") ]]
--[[ end ]]
--
--
--
--
require("_bufferline")
require("_indentline")
