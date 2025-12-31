return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    picker = { enabled = true },
    gh = { enabled = true },
  },
  keys = {
    -- File/buffer pickers (migrated from telescope)
    { '<leader>,', function() Snacks.picker.buffers() end, desc = 'Search open buffers' },
    { '<leader>.', function() Snacks.picker.files() end, desc = 'Search files' },
    { '<leader>/', function() Snacks.picker.lines() end, desc = 'Fuzzy search in buffer' },
    { '<leader>sf', function() Snacks.picker.files() end, desc = '[S]earch [F]iles' },
    { '<leader>sg', function() Snacks.picker.grep() end, desc = '[S]earch by [G]rep' },
    { '<leader>sw', function() Snacks.picker.grep_word() end, desc = '[S]earch current [W]ord' },
    { '<leader>sh', function() Snacks.picker.help() end, desc = '[S]earch [H]elp' },
    { '<leader>sk', function() Snacks.picker.keymaps() end, desc = '[S]earch [K]eymaps' },
    { '<leader>sd', function() Snacks.picker.diagnostics() end, desc = '[S]earch [D]iagnostics' },
    { '<leader>sr', function() Snacks.picker.resume() end, desc = '[S]earch [R]esume' },
    { '<leader>s.', function() Snacks.picker.recent() end, desc = '[S]earch Recent Files' },
    { '<leader>sn', function() Snacks.picker.files({ cwd = vim.fn.stdpath('config') }) end, desc = '[S]earch [N]eovim files' },
    { '<leader><leader>', function() Snacks.picker.buffers() end, desc = 'Find existing buffers' },
    -- GitHub pickers
    {
      '<leader>gp',
      function()
        Snacks.picker.gh_pr()
      end,
      desc = 'GitHub PRs',
    },
    {
      '<leader>gi',
      function()
        Snacks.picker.gh_issue()
      end,
      desc = 'GitHub Issues',
    },
    {
      '<leader>gD',
      function()
        local branch1 = nil

        -- Picker 1: Select base branch
        Snacks.picker.git_branches({
          prompt = 'Select BASE branch (comparing FROM):',
          all = true, -- Show local + remote
          confirm = function(picker, item)
            picker:close()
            if not item or not item.branch then
              vim.notify('No branch selected', vim.log.levels.WARN)
              return
            end

            branch1 = item.branch

            -- Picker 2: Select compare branch
            vim.schedule(function()
              Snacks.picker.git_branches({
                prompt = 'Select COMPARE branch (comparing TO): [base: ' .. branch1 .. ']',
                all = true,
                confirm = function(picker2, item2)
                  picker2:close()
                  if not item2 or not item2.branch then
                    vim.notify('Second branch not selected - comparison cancelled', vim.log.levels.WARN)
                    return
                  end

                  local branch2 = item2.branch

                  -- Validate: same branch check
                  if branch1 == branch2 then
                    vim.notify('Cannot compare branch with itself: ' .. branch1, vim.log.levels.ERROR)
                    return
                  end

                  -- Execute diffview
                  local cmd = 'DiffviewOpen ' .. branch1 .. '...' .. branch2
                  vim.notify('Opening diff: ' .. branch1 .. ' → ' .. branch2, vim.log.levels.INFO)

                  vim.schedule(function()
                    local success, err = pcall(vim.cmd, cmd)
                    if not success then
                      vim.notify('Error opening diffview: ' .. tostring(err), vim.log.levels.ERROR)
                    end
                  end)
                end,
              })
            end)
          end,
        })
      end,
      desc = 'Git [D]iff branches (compare two)',
    },
  },
}
