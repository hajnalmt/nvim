-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  {
    'nickjvandyke/opencode.nvim',
    version = '*',
    config = function()
      vim.g.opencode_opts = {}
      -- Required so Neovim reloads files changed by opencode.
      vim.o.autoread = true
      vim.keymap.set({ 'n', 'x' }, '<leader>oa', function()
        require('opencode').ask('@this: ', { submit = true })
      end, { desc = '[O]pencode [A]sk' })
      vim.keymap.set({ 'n', 'x' }, '<leader>os', function()
        require('opencode').select()
      end, { desc = '[O]pencode [S]elect' })
      vim.keymap.set({ 'n', 't' }, '<leader>ot', function()
        require('opencode').toggle()
      end, { desc = '[O]pencode [T]oggle' })
      vim.keymap.set({ 'n', 'x' }, '<leader>oo', function()
        return require('opencode').operator '@this '
      end, { desc = '[O]pencode add range', expr = true })
      vim.keymap.set('n', '<leader>ol', function()
        return require('opencode').operator '@this ' .. '_'
      end, { desc = '[O]pencode add line', expr = true })
    end,
  },
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gdiffsplit', 'Gvdiffsplit', 'Gedit', 'Gread', 'Gwrite' },
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
  },
  {
    'sindrets/diffview.nvim',
    cmd = {
      'DiffviewOpen',
      'DiffviewFileHistory',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewRefresh',
    },
    keys = {
      { '<leader>gdv', '<cmd>DiffviewOpen<CR>', desc = '[G]it [D]iff [V]iew' },
      { '<leader>gdh', '<cmd>DiffviewFileHistory %<CR>', desc = '[G]it [D]iff file [H]istory view' },
      { '<leader>gdq', '<cmd>DiffviewClose<CR>', desc = '[G]it [D]iff view close' },
    },
  },
}
