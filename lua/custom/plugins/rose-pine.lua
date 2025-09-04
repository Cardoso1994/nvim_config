return {
  {
    'rose-pine/neovim',
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      require('rose-pine').setup {
        variant = 'auto',
        dark_variant = 'moon',
        dim_inactive_windows = true,
      }
      vim.cmd 'colorscheme rose-pine'
    end,
    opts = {},
  },
}
