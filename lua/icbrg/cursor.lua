local M = {}

function M.setup(palette)
  local default = { fg = palette.cursor_bg, bg = palette.cursor_fg, reverse = false }
  local whitespace = { fg = palette.bg, bg = palette.cursor_bg, reverse = false }

  local function apply(sel)
    vim.api.nvim_set_hl(0, "Cursor", sel)
    vim.api.nvim_set_hl(0, "lCursor", sel)
    vim.api.nvim_set_hl(0, "CursorIM", sel)
    vim.api.nvim_set_hl(0, "TermCursor", sel)
  end

  local function update()
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))
    local line = (vim.api.nvim_buf_get_lines(0, row - 1, row, true) or {""})[1] or ""
    local ch = line:sub(col + 1, col + 1)
    local is_ws = ch == "" or ch:match("%s") ~= nil
    apply(is_ws and whitespace or default)
  end

  -- set initial highlights and autocommands
  apply(default)

  local group = vim.api.nvim_create_augroup("icbrgCursorToggle", { clear = true })
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "InsertEnter", "WinEnter" }, {
    group = group,
    callback = update,
  })

  -- update on colorscheme change in case palette/highlights are reapplied
  vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    group = group,
    callback = function() apply(default) end,
  })

  -- ensure correct state now
  update()
end

return M
