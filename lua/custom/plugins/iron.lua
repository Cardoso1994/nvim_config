-- lua/plugins/iron.lua

return {
  {
    'Vigemus/iron.nvim',
    keys = {
      -- Keymaps are mnemonic for Jupyter: <leader> j(upyter) ...
      {
        '<leader>js',
        function()
          require('iron.core').send(nil, vim.api.nvim_get_current_line())
        end,
        mode = 'n',
        desc = '[J]upyter [S]end Line',
      },
      {
        '<leader>j',
        function()
          require('iron.core').send(nil, require('iron.util').get_visual_selection())
        end,
        mode = 'v',
        desc = '[J]upyter Send Visual Selection',
      },
      {
        '<leader>jr',
        '<cmd>IronRepl<cr>',
        mode = 'n',
        desc = '[J]upyter [R]un (Open)',
      },
      {
        '<leader>jf',
        '<cmd>IronFocus<cr>',
        mode = 'n',
        desc = '[J]upyter [F]ocus',
      },
      {
        '<leader>jc',
        '<cmd>IronClose<cr>',
        mode = 'n',
        desc = '[J]upyter [C]lose',
      },
      {
        '<leader>jh',
        '<cmd>IronRestart<cr>',
        mode = 'n',
        desc = '[J]upyter Restart (Hard)',
      },
    },
    opts = {
      -- This table should only contain data (strings, numbers, simple tables),
      -- not function calls like require().
      config = {
        highlight = {
          name = 'IronPrimary',
        },
        repl_definition = {
          python = {
            command = { 'ipython', '--no-autoindent' },
          },
          sh = {
            command = { 'bash' },
          },
          lua = {
            command = { 'lua' },
          },
        },
      },
      core = {
        ensure_parsers = true,
      },
    },
    config = function(_, opts)
      -- The config function runs AFTER the plugin is loaded.
      -- This is the correct place to call functions from the plugin.

      -- FIX: Set the repl_open_cmd here, just before setting up.
      opts.config.repl_open_cmd = require('iron.view').right(50)
      opts.config.visibility = require('iron.visibility').focus

      require('iron.core').setup(opts)
      vim.api.nvim_set_hl(0, 'IronPrimary', { fg = '#61AFEF', bold = true })
    end,
  },
}
