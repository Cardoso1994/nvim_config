return {
  'jackplus-xyz/monaspace.nvim',
  lazy = false,
  priority = 999, -- Load before color scheme
  opts = {
    use_default = false, -- Disable defaults to use custom mappings
    style_map = {
      -- Map multi-line comments to bold (Krypton)
      bold = {
        -- Multi-line comments (Lua block comments, etc.)
        ['@comment.block'] = true,
      },

      -- Map single-line comments to italic (Radon)
      italic = {
        Comment = true,
        ['@comment'] = true,
        ['@comment.line'] = true,
      },

      -- Map docstrings to bold_italic (Krypton, less italic)
      bold_italic = {
        -- Python docstrings
        ['@string.documentation.python'] = true,
        ['@comment.documentation'] = true,
        ['@comment.block.documentation'] = true,
      },
    },
  },
}
