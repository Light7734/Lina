local status_ok, nvim_tree = pcall(require, "nvim-tree")
local config_status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not status_ok or not config_status_ok then
	return
end

local tree_callback = nvim_tree_config.nvim_tree_callback

nvim_tree.setup({
	update_focused_file = {
		enable = true,
		update_cwd = false,
	},
	renderer = {
		root_folder_modifier = ":t",
		icons = {
            enable = false,
			glyphs = {
				default = "",
				symlink = "",
				folder = {
					arrow_open = "",
					arrow_closed = "",
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
					symlink_open = "",
				},
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					untracked = "U",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	diagnostics = {
		enable = false,
		show_on_dirs = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	view = {
		width = 42,
		-- height = 30,
		side = "right",
		mappings = {
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_callback("edit") },
				{ key = "h", cb = tree_callback("close_node") },
				{ key = "v", cb = tree_callback("vsplit") },
			},
		},
	},
})
