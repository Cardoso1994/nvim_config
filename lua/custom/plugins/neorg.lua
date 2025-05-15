return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'hrsh7th/nvim-cmp', -- Optional: for completion support
  },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes', -- Configure your workspaces here
            },
            default_workspace = 'notes',
          },
        },
        ['core.completion'] = { -- Enables completion support
          config = {
            engine = 'nvim-cmp',
          },
        },
        ['core.integrations.nvim-cmp'] = {}, -- Integrates with nvim-cmp
        -- Additional optional modules:
        ['core.export'] = {}, -- Export to different formats
        ['core.export.markdown'] = {}, -- for tangling (code blocks)
        ['core.tangle'] = {}, -- for tangling (code blocks)
        ['core.presenter'] = {}, -- Presentation mode
        ['core.ui.calendar'] = {}, -- Calendar integration
      },
    }
  end,
  ft = 'norg', -- Load when a .norg file is opened
  cmd = 'Neorg', -- Load when the Neorg command is used
}
