return {
  'jackplus-xyz/monaspace.nvim',
  lazy = false,
  priority = 999, -- Load before color scheme
  opts = {
    use_default = false, -- Disable defaults to use custom mappings
    style_map = {
      -- Map single-line comments to italic (Radon)
      italic = {
        Comment = true,
        ['@comment'] = true,
        ['@comment.line'] = true,
      },
    },
  },
}
