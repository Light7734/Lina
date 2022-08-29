local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Base
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim

    -- Colorschemes
    use "lunarvim/colorschemes"
    use "EdenEast/nightfox.nvim"
    use "xiyaowong/nvim-transparent"
    --
    -- Autocomplete
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "saadparwaiz1/cmp_luasnip"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

    -- Snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- Telescope
    use {
        "nvim-telescope/telescope.nvim",
        requires =  { { "nvim-lua/plenary.nvim" } },
    }
    use "BurntSushi/ripgrep"

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"

    -- Autopair
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter

    -- Comment
    use "numToStr/Comment.nvim"
    use 'JoosepAlviste/nvim-ts-context-commentstring'

    -- Git
    use "lewis6991/gitsigns.nvim"

    -- Explorer
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    -- Bufferline
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"

    -- Lualine
    use 'nvim-lualine/lualine.nvim'

    -- Misc
    use "norcalli/nvim-colorizer.lua" -- Colorizer

  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)

