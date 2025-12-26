-- Auto-wrap settings for markdown files
vim.opt_local.textwidth = 80
vim.opt_local.wrap = true
vim.opt_local.linebreak = true

-- Format options:
-- t = auto-wrap text using textwidth
-- c = auto-wrap comments
-- q = allow formatting with gq
-- n = recognize numbered lists
-- j = remove comment leader when joining lines
vim.opt_local.formatoptions = "tcqnj"

-- Keymap to reformat entire buffer (useful for files created outside nvim)
vim.keymap.set("n", "<leader>gq", "gggqG``", { buffer = true, desc = "Reformat entire buffer to textwidth" })
