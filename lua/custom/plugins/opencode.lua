-- opencode.nvim: in-editor AI agent
-- https://github.com/nickjvandyke/opencode.nvim
return {
  'nickjvandyke/opencode.nvim',
  version = '*',
  config = function()
    vim.g.opencode_opts = {}
    -- Required so Neovim reloads files changed by opencode.
    vim.o.autoread = true
    vim.keymap.set({ 'n', 'x' }, '<leader>aa', function()
      require('opencode').ask('@this: ', { submit = true })
    end, { desc = '[A]gent opencode [A]sk' })
    vim.keymap.set({ 'n', 'x' }, '<leader>as', function()
      require('opencode').select()
    end, { desc = '[A]gent opencode [S]elect' })
    vim.keymap.set({ 'n', 't' }, '<leader>at', function()
      require('opencode').toggle()
    end, { desc = '[A]gent opencode [T]oggle' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ao', function()
      return require('opencode').operator '@this '
    end, { desc = '[A]gent opencode add range', expr = true })
    vim.keymap.set('n', '<leader>al', function()
      return require('opencode').operator '@this ' .. '_'
    end, { desc = '[A]gent opencode add line', expr = true })
  end,
}
