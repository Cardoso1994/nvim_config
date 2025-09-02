return {
  {
    'f4z3r/gruvbox-material.nvim',
    lazy = false, -- Load during startup
    priority = 1000, -- Load this before other colorschemes
    enabled = true,
    config = function()
      require('gruvbox-material').setup {
        -- Set contrast and palette
        contrast = 'medium',
      }
      vim.cmd 'colorscheme gruvbox-material'
    end,
    opts = {},
  },
}
