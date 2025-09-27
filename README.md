# Icbrg

A Colorscheme based on Iceberg Dark theme

## Usage

To enable this colorscheme:

```vim
colorscheme icbrg
```

```lua
vim.cmd[[colorscheme icbrg]]
```

To override the default settings you need to call setup before enabling the
colorscheme. Icbrg will use these settings, unless you call setup
and override these.

```lua
require("icbrg").setup({
  transparent = false, -- Enable this to disable the bg color
  styles = {
    -- You can set any of the style values specified for `:h nvim_set_hl`
    comments = {},
    keywords = {},
    functions = {},
    variables = {},
    type = { bold = true },
    lsp = { underline = true }
  },
})
```

## Supported Plugins

- Alpha
- Dadbod-ui
- Git
- Hop
- Lazy
- Leap
- Lir
- LSP
- Lualine
- Markdown
- Mason
- Neogit
- NvimCmp
- NvimTree
- StatusLine
- Telescope
- Treesitter
- WhichKey
