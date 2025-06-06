-- return {
--   'nvim-neorg/neorg',
--   lazy = false, -- Disable lazy loading
--   version = '*', -- Pin Neorg to latest release
--   config = true,
-- }

-- return {}
return {
  'nvim-neorg/neorg',
  build = ':Neorg sync-parsers',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('neorg').setup {
      load = {
        ['core.defaults'] = {}, -- Loads default behaviour
        ['core.concealer'] = {}, -- Adds pretty icons to your documents
        ['core.dirman'] = { -- Manages Neorg workspaces
          config = {
            workspaces = {
              notes = '~/notes',
            },
          },
        },
      },
    }
  end,
}
