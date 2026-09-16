-- vim-fugitive: Git wrapper
-- https://github.com/tpope/vim-fugitive
return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gedit', 'Gread', 'Gwrite' },
  init = function()
    -- Ensure ~/.local/bin is in PATH so fugitive can find gh, git, etc.
    vim.env.PATH = vim.fn.expand('~/.local/bin') .. ':' .. vim.env.PATH
    -- Clear exepath cache so it uses the new PATH
    vim.fn.exepath('gh')
  end,
  keys = {
    { '<leader>gs', '<cmd>Git<CR>', desc = '[G]it [S]tatus' },
    { '<leader>gds', '<cmd>Gdiffsplit<CR>', desc = '[G]it [D]iff [S]plit' },
    { '<leader>gc', '<cmd>Git commit -s<CR>', desc = '[G]it [C]ommit signed' },
    { '<leader>ga', '<cmd>Git commit --amend -s<CR>', desc = '[G]it [A]mend signed' },
    { '<leader>gA', '<cmd>Git commit --amend --no-edit -s<CR>', desc = '[G]it [A]mend no-edit signed' },
    { '<leader>gb', '<cmd>Git blame<CR>', desc = '[G]it [B]lame' },
    { '<leader>gp', '<cmd>Git push -u origin HEAD<CR>', desc = '[G]it [P]ush current branch' },
    { '<leader>gP', '<cmd>Git push --force -u origin HEAD<CR>', desc = '[G]it [P]ush current branch' },
  },
}
