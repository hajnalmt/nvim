-- Netrw control
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
vim.keymap.set('n', '<leader>cp', ':let @+=expand("%:p")<CR>', { desc = 'Copy file path' })
