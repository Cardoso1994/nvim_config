return {
  'oonamo/ef-themes.nvim',
  lazy = false,
  enabled = false,
  config = function()
    require('ef-themes').setup {
      light = 'ef-tritanopia-light',
      dark = 'ef-tritanopia-dark',
    }
    -- vim.cmd.colorscheme 'ef-theme' -- Use the default theme switching
  end,
}
