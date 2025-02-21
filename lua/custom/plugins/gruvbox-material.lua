return {
  {
    'sainnhe/gruvbox-material',
    lazy = false, -- Load during startup
    priority = 1000, -- Load this before other colorschemes
    enabled = false,
    config = function()
      -- Set contrast and palette
      vim.g.gruvbox_material_background = 'medium' -- Options: 'hard', 'medium'(default), 'soft'
      vim.g.gruvbox_material_foreground = 'material' -- Options: 'material'(default), 'mix', 'original'
      vim.g.gruvbox_material_better_performance = 1
      -- Set colorscheme
      vim.cmd.colorscheme 'gruvbox-material'
    end,
    opts = {},
  },
}
