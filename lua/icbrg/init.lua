local M = {}

function M.setup(opts)
    local settings = require "icbrg.settings"
    if opts then
        settings.set(opts)
    end
end

function M.load()
    local settings = require "icbrg.settings"
    local opts = settings.opts

    vim.api.nvim_command "hi clear"
    if vim.fn.exists "syntax_on" then
        vim.api.nvim_command "syntax reset"
    end

    vim.o.background = "dark"
    vim.o.termguicolors = true
    vim.g.colors_name = "icbrg"

    local util = require "icbrg.util"
    local palette = require "icbrg.palette"
    local groups = require "icbrg.groups"

    for _, group in ipairs(groups) do
        group = group.highlight(palette, opts)
        util.initialise(group)
    end

    -- setup cursor behaviour that adapts on whitespace
    local cursor = require "icbrg.cursor"
    cursor.setup(palette)
end

return M
