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
    blue = "#458588",
    green = "#98971a",
    purple = "#b16286",
    cyan = "#83a598",
    red1 = "#cc241d",
    yellow = "#d79921",
    fg = "#ebdbb2",
    bg = "#282828",
    gray1 = "#928374",
    gray2 = "#7c6f64",
    gray3 = "#665c54",
}

local gruvbox = {
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
        theme = gruvbox,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard", "NvimTree", "Outline" },
        always_divide_middle = true,
    },
    sections = {
        lualine_a = { "filename" },
        lualine_b = { { "diagnostics", colored = false }},
        lualine_c = {},
        lualine_x = {branch, diff},
        lualine_y = { },
        lualine_z = {  },
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
