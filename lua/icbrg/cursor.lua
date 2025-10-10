local M = {}

function M.setup(palette)
  -- Cursor block should use the theme foreground color, and the text under it should use the theme background color.
  -- Set the Cursor highlights once and reapply on ColorScheme; do not change dynamically on movement.
  local sel = { fg = palette.bg, bg = palette.fg, reverse = false }

  local function apply()
    vim.api.nvim_set_hl(0, "Cursor", sel)
    vim.api.nvim_set_hl(0, "lCursor", sel)
    vim.api.nvim_set_hl(0, "CursorIM", sel)
    vim.api.nvim_set_hl(0, "TermCursor", sel)
  end

  -- set initial highlights
  apply()

  -- Reapply on colorscheme change in case palette/highlights are reapplied
  local group = vim.api.nvim_create_augroup("icbrgCursor", { clear = true })
  vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    group = group,
    callback = apply,
  })
end

return M
