-- Octo: edit and review GitHub issues and pull requests from Neovim
-- https://github.com/pwntester/octo.nvim
--
-- Requires the `gh` CLI (authenticated). Works with github.com and
-- GitHub Enterprise hosts (e.g. github-am.int.automotive-wan.com) that
-- you are logged into via `gh auth login`.
return {
  'pwntester/octo.nvim',
  cmd = 'Octo',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  opts = {
    picker = 'telescope',
    enable_builtin = true,
    default_to_projects_v2 = true,
    suppress_missing_scope = {
      projects_v2 = true,
    },
  },
  keys = {
    { '<leader>oo', '<cmd>Octo<CR>', desc = '[O]cto menu' },
    { '<leader>op', '<cmd>Octo pr list<CR>', desc = '[O]cto [P]R list' },
    { '<leader>oP', '<cmd>Octo pr search<CR>', desc = '[O]cto [P]R search' },
    { '<leader>oi', '<cmd>Octo issue list<CR>', desc = '[O]cto [I]ssue list' },
    { '<leader>oI', '<cmd>Octo issue search<CR>', desc = '[O]cto [I]ssue search' },
    { '<leader>or', '<cmd>Octo review start<CR>', desc = '[O]cto [R]eview start' },
    { '<leader>oR', '<cmd>Octo review resume<CR>', desc = '[O]cto [R]eview resume' },
    { '<leader>os', '<cmd>Octo review submit<CR>', desc = '[O]cto review [S]ubmit' },
  },
}
