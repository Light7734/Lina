local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local formatting = null_ls.builtins.formatting

local diagnostics = null_ls.builtins.diagnostics

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = false,
	on_init = function(new_client, _)
		new_client.offset_encoding = "utf-32"
	end,
	sources = {
		formatting.clang_format,
		formatting.prettier.with({
			extra_args = function(params)
				return params.options and params.options.tabSize and {
					"--tab-width",
					4,
				}
			end,
		}),
		formatting.black,
		formatting.stylua,
		formatting.yapf,
		null_ls.builtins.code_actions.xo,
		diagnostics.flake8,
	},

	on_attach = function(client, bufnr)
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd({ "BufWritePre" }, {
			group = augroup,
			buffer = bufnr,
			callback = function()
				local util = require("vim.lsp.util")
				local params = util.make_formatting_params({})
				client.request("textDocument/formatting", params, nil, bufnr)
			end,
		})
	end,
})
