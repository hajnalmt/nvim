-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Netrw control ]]
vim.keymap.set('n', '<leader>pv', '<cmd>Explore %:p:h<CR>', { desc = '[P]roject [V]iew current file dir' })

vim.keymap.set('n', '<leader>pc', function()
  vim.ui.input({ prompt = 'Create/edit file: ', completion = 'file' }, function(path)
    if path and path ~= '' then
      vim.cmd.edit(path)
    end
  end)
end, { desc = '[P]roject [C]reate/edit file' })

vim.keymap.set('n', '<leader>pd', function()
  vim.ui.input({ prompt = 'Create directory: ', completion = 'dir' }, function(path)
    if path and path ~= '' then
      vim.fn.mkdir(path, 'p')
      vim.cmd.edit(path)
    end
  end)
end, { desc = '[P]roject create [D]irectory' })

-- Personal keymaps
vim.keymap.set('n', '<leader>cfp', ':let @+=expand("%:p")<CR>', { desc = '[C]opy [F]ile [P]ath' })
vim.keymap.set('n', '<leader>cd', '<cmd>cd %:p:h<CR>', { desc = '[C]hange to current file [D]ir' })

-- Use <CR> to accept the highlighted command-line completion.
-- When the wildmenu is open, <CR> accepts the selection (built-in <C-y>);
-- otherwise it behaves normally and runs the typed command.
vim.keymap.set('c', '<CR>', function()
  return vim.fn.wildmenumode() == 1 and '<C-y>' or '<CR>'
end, { expr = true })
