local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
    return
end

require("_lsp._installer")
require("_lsp._handlers").setup()
