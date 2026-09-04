-- opencode.nvim: in-editor AI agent
-- https://github.com/nickjvandyke/opencode.nvim
local opencode_cmd = 'opencode'
local terminal_opts = { win = { position = 'right', enter = false } }

local function toggle()
  require('snacks.terminal').toggle(opencode_cmd, terminal_opts)
end

return {
  'nickjvandyke/opencode.nvim',
  version = '*',
  dependencies = {
    'folke/snacks.nvim',
  },
  init = function()
    vim.g.opencode_opts = {
      server = {
        start = function()
          require('snacks.terminal').open(opencode_cmd, terminal_opts)
        end,
      },
    }
    vim.o.autoread = true
  end,
  config = function()
    vim.keymap.set({ 'n', 'x' }, '<leader>aa', function()
      require('opencode').ask '@this: '
    end, { desc = '[A]gent opencode [A]sk' })
    vim.keymap.set({ 'n', 'x' }, '<leader>as', function()
      require('opencode').select()
    end, { desc = '[A]gent opencode [S]elect' })
    vim.keymap.set({ 'n', 't' }, '<leader>at', toggle, { desc = '[A]gent opencode [T]oggle' })
    vim.keymap.set({ 'n', 'x' }, '<leader>ao', function()
      return require('opencode').operator '@this '
    end, { desc = '[A]gent opencode add range', expr = true })
    vim.keymap.set('n', '<leader>al', function()
      return require('opencode').operator '@this ' .. '_'
    end, { desc = '[A]gent opencode add line', expr = true })
  end,
}
