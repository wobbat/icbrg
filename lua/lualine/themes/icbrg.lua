-- Colorscheme for lualine

local palette = require "icbrg.palette"

local colors = {
    bg = palette.bg,
    fg = palette.fg,
    blue = palette.blue,
    green = palette.green,
    orange = palette.orange,
    yellow = palette.yellow,
    red = palette.red,
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
