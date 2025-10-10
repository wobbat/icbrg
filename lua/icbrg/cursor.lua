local M = {}

function M.setup(palette)
  -- Use theme foreground as the cursor block color and theme background for the text under it.
  local cursor_hl = { fg = palette.bg, bg = palette.fg }

  -- apply highlights for all relevant cursor groups
  local function apply()
    for _, name in ipairs({ "Cursor", "lCursor", "CursorIM", "TermCursor" }) do
      vim.api.nvim_set_hl(0, name, cursor_hl)
    end
  end

  apply()

  -- set a sensible guicursor value where supported (guarded)
  pcall(function()
    vim.o.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25,r-cr:hor20"
  end)

  -- reapply highlights when the colorscheme changes
  local group = vim.api.nvim_create_augroup("icbrgCursor", { clear = true })
  vim.api.nvim_create_autocmd("ColorScheme", {
    group = group,
    callback = apply,
  })
end

return M

