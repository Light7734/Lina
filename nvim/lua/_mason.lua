local function try_require(name)
	local status_ok, val = pcall(require, name)

	if not status_ok then
		print("try require failed - ", name)
		print(val)
		return nil
	end

	return val
end

local mason = try_require("mason")
local mason_lspconfig = try_require("mason-lspconfig")
local lspconfig = try_require("lspconfig")
local default_config = try_require("_lspconfigs._default")

local status_ok = mason and mason_lspconfig and lspconfig and default_config

if not status_ok then
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = { "clangd" },
})

lspconfig["clangd"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["tsserver"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["eslint"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["cssls"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["emmet_ls"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["stylelint_lsp"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["tailwindcss"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["pylsp"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})

lspconfig["hls"].setup({
	on_attach = default_config.on_attach,
	capabilities = default_config.capabilities,
})


default_config.setup()
