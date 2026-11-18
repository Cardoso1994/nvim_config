-- nightfox.nvim: dawnfox for light backgrounds, carbonfox for dark ones.
-- The WezTerm side lives in ~/dotfiles/wezterm/config/colors.lua (family
-- "nightfox"), with palettes copied from the plugin's extra/ directory.
local styles = { light = 'dawnfox', dark = 'carbonfox' }

local function apply_for_background()
  local target = styles[vim.o.background] or styles.dark
  if vim.g.colors_name ~= target then
    vim.cmd.colorscheme(target)
  end
end

-- On macOS, read the system appearance directly. Inside tmux, Neovim's
-- terminal background query is answered by tmux, which only learns WezTerm's
-- colors when a client attaches, so it goes stale after an appearance change.
local function sync_background_with_macos()
  if vim.fn.has 'mac' == 0 then
    return
  end
  local result = vim.system({ 'defaults', 'read', '-g', 'AppleInterfaceStyle' }, { text = true }):wait()
  local wanted = (result.stdout or ''):match 'Dark' and 'dark' or 'light'
  if vim.o.background ~= wanted then
    vim.o.background = wanted
  end
end

return {
  {
    'EdenEast/nightfox.nvim',
    lazy = false,
    enabled = false, -- gruvbox-material is the active colorscheme
    priority = 1000, -- Load this before other colorschemes
    config = function()
      require('nightfox').setup {
        options = {
          dim_inactive = true,
          styles = {
            comments = 'italic',
            keywords = 'bold',
          },
        },
      }
      sync_background_with_macos()
      apply_for_background()

      -- Follow 'background' (<leader>tb toggles it manually), and re-check the
      -- macOS appearance whenever Neovim regains focus.
      local group = vim.api.nvim_create_augroup('nightfox-background', { clear = true })
      vim.api.nvim_create_autocmd('OptionSet', {
        pattern = 'background',
        group = group,
        callback = apply_for_background,
      })
      vim.api.nvim_create_autocmd('FocusGained', {
        group = group,
        callback = sync_background_with_macos,
      })
    end,
  },
}
