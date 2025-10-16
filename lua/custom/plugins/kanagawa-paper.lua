return {
  {
    'thesimonho/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000, -- Load this before other colorschemes
    enabled = false,
    config = function()
<<<<<<< HEAD
      -- require('kanagawa-paper').setup {
      --   theme = 'wave',
      --   background = {
      --     dark = 'dragon',
      --     light = 'lotus',
      --   },
      -- }
      -- vim.cmd 'colorscheme kanagawa-paper'
=======
      require('kanagawa-paper').setup {
        dim_inactive = true,
      }
      vim.cmd 'colorscheme kanagawa-paper'
>>>>>>> 2e47eb95c63c5eae7c6908f6fda4ef26f1910dc2
    end,
  },
}
