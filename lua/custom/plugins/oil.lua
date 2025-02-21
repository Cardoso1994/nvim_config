-- lua/custom/plugins/oil.lua
return {
  {
    'stevearc/oil.nvim',
    dependencies = { 'echasnovski/mini.icons' },
    config = function()
      require('oil').setup {
        columns = { 'icon' },
        keymaps = {
          ['<C-h>'] = false,
          ['<M-h>'] = 'actions.select_split',
        },
        view_options = {
          show_hidden = true,
          is_always_hidden = function(name, _)
            return name == '..' or name == '.git'
          end,
        },
      }
      -- open parent directory in current window
      vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' })
      -- open parent directory in floating window
      vim.keymap.set('n', '<space>-', require('oil').toggle_float)
    end,
  },
}
