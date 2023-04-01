vim.opt.clipboard = "unnamedplus"
vim.opt.completeopt = { "menu", "menuone", "preview" }
vim.opt.fileencoding = "utf-32"
vim.opt.ignorecase = true
vim.opt.pumheight = 12
vim.opt.cmdheight = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.updatetime = 300
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6
vim.opt.showmode = false

vim.opt.colorcolumn = "100"

vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

vim.opt.autoindent = true

vim.opt.showtabline = 0

vim.opt.cursorline = false
vim.opt.numberwidth = 4
vim.opt.shortmess:append("c")

vim.opt.laststatus = 1

vim.cmd("colorscheme dracula")

vim.cmd('let g:neovide_cursor_vfx_mode = "pixiedust"')
vim.cmd("let g:neovide_cursor_vfx_particle_density = 18.0")
