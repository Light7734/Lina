require "_options"
require "_keymaps"
require "_plugins"
require "_auto_complete"
require "_lsp"
require "_telescope"
require "_treesitter"
require "_autopairs"
require "_comment"
require "_gitsigns"
require "_nvim_tree"
require "_bufferline"
require "_null_ls"
require "_lualine"

vim.cmd "colorscheme onedarker"

require("transparent").setup({
  enable = false, -- boolean: enable transparent
  extra_groups = { "all" },
})
