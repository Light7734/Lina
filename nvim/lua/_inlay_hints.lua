require("lsp-inlayhints").setup({
	highlight = DraculaRed,
	enabled_at_startup = false,
})

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
	group = "LspAttach_inlayhints",
	callback = function(args)
		if not (args.data and args.data.client_id) then
			return
		end

		local bufnr = args.buf
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		require("lsp-inlayhints").on_attach(client, bufnr)
	end,
})

--[[]]
--[[ local status_ok, ih = pcall(require, "inlay-hints") ]]
--[[ if not status_ok then ]]
--[[ 	return ]]
--[[ end ]]
--[[]]
--[[ ih.setup({ ]]
--[[ 	hints = { ]]
--[[ 		parameter = { ]]
--[[ 			show = true, ]]
--[[ 			highlight = "Comment", ]]
--[[ 		}, ]]
--[[ 		type = { ]]
--[[ 			show = false, ]]
--[[ 			highlight = "Comment", ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[]]
--[[ 	eol = { ]]
--[[ 		parameter = { ]]
--[[ 			separator = ", ", ]]
--[[ 			format = function(hints) ]]
--[[ 				return string.format("<- %s", hints:gsub("[\\(\\)_:=.]", "")) ]]
--[[ 			end, ]]
--[[ 		}, ]]
--[[ 	}, ]]
--[[ }) ]]
--[[ ih.disable() ]]
