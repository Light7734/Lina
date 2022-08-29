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

    -- if server.name == "jsonsls" then
    --     local json_opts = require("lang_serv_prot.settings.jsonls")
    --     opts = vim.tbl_deep_extend("force", jsonsls_opts, opts)
    -- end

    -- if server.name == "sumneko_lua" then
    --     local sumneko_opts = require("lsp.settings.sumneko_lua")
    --     opts = vim.tbl_deep_extend("force", sumneko_lua, opts)
    -- end

    server:setup(opts)
end)
