-- lua/plugins/iron.lua

return {
  {
    'Vigemus/iron.nvim',
    keys = {
      -- Keymaps are mnemonic for Jupyter: <leader> j(upyter) ...
      {
        '<leader>js',
        function()
          require('iron.core').send_line()
          require('iron.core').send(nil, '\r') -- \r is carriage return (Enter)
        end,
        mode = 'n',
        desc = '[J]upyter [S]end Line',
      },
      {
        '<leader>j',
        function()
          require('iron.core').visual_send()
          require('iron.core').send(nil, '\r') -- \r is carriage return (Enter)
        end,
        mode = 'v',
        desc = '[J]upyter Send Visual Selection',
      },
      {
        '<leader>jr',
        function()
          require('iron.core').repl_for(vim.bo.filetype)
        end,
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
        function()
          require('iron.core').close_repl()
        end,
        mode = 'n',
        desc = '[J]upyter [C]lose',
      },
      {
        '<leader>jh',
        function()
          require('iron.core').repl_restart()
        end,
        mode = 'n',
        desc = '[J]upyter Restart (Hard)',
      },
      -- Additional useful keybinds
      {
        '<leader>jq',
        function()
          require('iron.core').send(nil, 'exit')
        end,
        mode = 'n',
        desc = '[J]upyter [Q]uit REPL',
      },
      {
        '<leader>ji',
        function()
          require('iron.core').send(nil, vim.api.nvim_replace_termcodes('<C-c>', true, false, true))
        end,
        mode = 'n',
        desc = '[J]upyter [I]nterrupt',
      },
      {
        '<leader>jp',
        function()
          require('iron.core').send_paragraph()
          require('iron.core').send(nil, '\r') -- \r is carriage return (Enter)
        end,
        mode = 'n',
        desc = '[J]upyter Send [P]aragraph',
      },
    },
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'

      iron.setup {
        config = {
          -- Whether a repl should be discarded or not
          scratch_repl = true,
          -- Your repl definitions come here
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
          -- How the repl window will be displayed
          repl_open_cmd = view.bottom(40),
        },
        -- Iron doesn't set keymaps by default anymore.
        -- We're handling them in the keys section above
        keymaps = {
          -- You can add additional keymaps here that will be set
          -- when iron loads, but since we're using lazy loading,
          -- it's better to define them in the keys section
        },
        -- If the highlight is on, you can change how it looks
        highlight = {
          italic = true,
        },
        ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
      }
    end,
  },
}
