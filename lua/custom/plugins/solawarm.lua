-- solawarm.nvim — local repo at ~/repos/solawarm.nvim
-- When published to GitHub, replace `dir` with 'YOURNAME/solawarm.nvim'.
return {
  {
    dir = vim.fn.expand '~/repos/solawarm.nvim',
    name = 'solawarm',
    lazy = false,
    priority = 1000,
    config = function()
      vim.o.background = 'dark' -- 'light' for the warm-cream light variant
      vim.cmd 'colorscheme solawarm'
    end,
  },
}
