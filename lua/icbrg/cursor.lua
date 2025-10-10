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

  -- attempt to set terminal cursor color (OSC 12) to the theme foreground; many terminals respect this
  local function set_term_cursor_color()
    if vim.fn.exists('$TERM') == 1 then
      -- emit OSC 12 escape sequence with BEL terminator
      vim.api.nvim_out_write(string.format("\27]12;%s\7", palette.fg))
    end
  end

  -- configure guicursor to explicitly use the Cursor highlight where supported
  pcall(function()
    vim.o.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20-Cursor"
  end)

  -- Reapply on colorscheme change in case palette/highlights are reapplied
  local group = vim.api.nvim_create_augroup("icbrgCursor", { clear = true })
  vim.api.nvim_create_autocmd({ "ColorScheme" }, {
    group = group,
    callback = function()
      apply()
      set_term_cursor_color()
    end,
  })

  -- also set terminal cursor color now
  set_term_cursor_color()
end

return M
