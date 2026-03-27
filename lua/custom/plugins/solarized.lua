return {
  {
    'Tsuzat/NeoSolarized.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('NeoSolarized').setup {
        style = 'dark',
        transparent = false,
        terminal_colors = true,
        enable_italics = true,
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          string = { italic = true },
          underline = true,
          undercurl = true,
        },
        on_highlights = function(highlights, colors)
          highlights['@string.documentation'] = { fg = colors.green, bold = true }
        end,
      }
      vim.cmd 'colorscheme NeoSolarized'
    end,
  },
}
