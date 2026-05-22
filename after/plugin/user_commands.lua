# Neovim custom user commands
vim.api.nvim_create_user_command('CopyPath', function() local path = vim.fn.expand('%:p') if path == '' then print('No file name (empty buffer)') return end vim.fn.setreg('+', path) print('Copied: ' .. path) end, {})
