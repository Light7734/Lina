local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local branch = {
	"branch",
	icons_enabled = true,
	icon = "",
}

local diff = {
	"diff",
	colored = false,
	symbols = { added = " ", modified = " ", removed = " " }, -- changes diff symbols
}
local location = {
	"location",
	padding = 0,
}

local colors = {
	blue = "#61afef",
	green = "#98c379",
	purple = "#c678dd",
	cyan = "#56b6c2",
	red1 = "#e06c75",
	red2 = "#be5046",
	yellow = "#e5c07b",
	fg = "#abb2bf",
	bg = "#282c34",
	gray1 = "#828997",
	gray2 = "#2c323c",
	gray3 = "#3e4452",
}

local onedarktheme = {
	normal = {
		a = { fg = colors.bg, bg = colors.blue, gui = "bold" },
		c = { fg = colors.bg, bg = colors.blue, gui = "bold" },
		z = { fg = colors.bg, bg = colors.blue, gui = "bold" },
	},
	command = {
		a = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
		c = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
		z = { fg = colors.bg, bg = colors.yellow, gui = "bold" },
	},
	insert = {
		a = { fg = colors.bg, bg = colors.green, gui = "bold" },
		c = { fg = colors.bg, bg = colors.green, gui = "bold" },
		z = { fg = colors.bg, bg = colors.green, gui = "bold" },
	},
	visual = {
		a = { fg = colors.bg, bg = colors.purple, gui = "bold" },
		c = { fg = colors.bg, bg = colors.purple, gui = "bold" },
		z = { fg = colors.bg, bg = colors.purple, gui = "bold" },
	},
	terminal = {
		a = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
		c = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
		z = { fg = colors.bg, bg = colors.cyan, gui = "bold" },
	},
	replace = {
		a = { fg = colors.bg, bg = colors.red1, gui = "bold" },
		c = { fg = colors.bg, bg = colors.red1, gui = "bold" },
		z = { fg = colors.bg, bg = colors.red1, gui = "bold" },
	},
	inactive = {
		a = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
		c = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
		z = { fg = colors.gray1, bg = colors.bg, gui = "bold" },
	},
}

lualine.setup({
	options = {
		icons_enabled = true,
		theme = onedarktheme,
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
		always_divide_middle = true,
	},
	sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = { branch, diff },
	},
	inactive_sections = {
		lualine_a = { "filename" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	extensions = {},
})
