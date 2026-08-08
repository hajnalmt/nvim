-- diffview.nvim: single-tabpage git diff and file history
-- https://github.com/sindrets/diffview.nvim
return {
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
}
