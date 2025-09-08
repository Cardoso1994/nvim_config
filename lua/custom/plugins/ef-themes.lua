return {
  'oonamo/ef-themes.nvim',
  lazy = flase,
  enabled = true,
  config = function()
    require('ef-themes').setup {
      light = 'ef-tritanopia-light',
      dark = 'ef-tritanopia-dark',
    }
    -- vim.cmd 'colorscheme ef-theme'
    vim.cmd 'colorscheme ef-tritanopia-light'
  end,
}
