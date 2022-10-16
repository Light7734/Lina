local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not status_ok then
    return
end

-- Register a handler
lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("_lsp._handlers").on_attach,
        capabilities = require("_lsp._handlers").capablities,
    }

    server:setup(opts)
end)

