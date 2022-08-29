local configs = require("nvim-treesitter.configs")

configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = { "" },
    autopairs = {
        enable = true
    },
    context_commenting = {
        enable = true,
        enable_autocmd = false,
    },
    highlight = {
        enable = true,
        disable = { "" },
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } },
}
