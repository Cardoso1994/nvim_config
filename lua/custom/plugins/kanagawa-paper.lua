return {
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000, -- Load this before other colorschemes
    enabled = true,
    config = function()
      require('kanagawa-paper').setup {
        dim_inactive = true,
      }
      vim.cmd 'colorscheme kanagawa-paper'
    end,
  },
}
