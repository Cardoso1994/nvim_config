-- gruvbox-material: medium contrast, material palette, light and dark.
-- The WezTerm side lives in ~/dotfiles/wezterm/config/colors.lua (family
-- "gruvboxMaterial") and the sway side in ~/dotfiles/sway/themes/.
local function apply_for_background()
  -- The plugin reads 'background' when the colorscheme loads, so reload it
  -- whenever 'background' changes.
  vim.cmd.colorscheme 'gruvbox-material'
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
    'sainnhe/gruvbox-material',
    lazy = false,
    priority = 1000, -- Load this before other colorschemes
    config = function()
      vim.g.gruvbox_material_background = 'medium' -- 'hard', 'medium', 'soft'
      vim.g.gruvbox_material_foreground = 'material' -- 'material', 'mix', 'original'
      vim.g.gruvbox_material_enable_italic = 1
      -- Let WezTerm's window_background_opacity (0.97) show through: nvim stops
      -- painting its own background. 2 also covers the status line, tabline
      -- and sign column. Dimming inactive windows paints an opaque background,
      -- so it stays off.
      vim.g.gruvbox_material_transparent_background = 2
      vim.g.gruvbox_material_dim_inactive_windows = 0

      sync_background_with_macos()
      apply_for_background()

      -- Follow 'background' (<leader>tb toggles it manually), and re-check the
      -- macOS appearance whenever Neovim regains focus.
      local group = vim.api.nvim_create_augroup('gruvbox-material-background', { clear = true })
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
