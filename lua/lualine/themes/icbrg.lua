-- Colorscheme for lualine

local colors = {
    bg = "#000000",
    fg = "#a6a6a6",
    blue = "#717f87",
    green = "#65763e",
    orange = "#b3733d",
    yellow = "#ab8652",
    red = "#7e4a3e",
}

return {
    normal = {
        a = { fg = colors.bg, bg = colors.red, gui = "bold" },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    insert = { a = { fg = colors.bg, bg = colors.green, gui = "bold" } },
    visual = { a = { fg = colors.bg, bg = colors.orange, gui = "bold" } },
    command = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
    replace = { a = { fg = colors.fg, bg = colors.bg, gui = "bold" } },
    inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
}
