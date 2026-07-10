-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`.
--
-- See `:help gitsigns` to understand what the configuration keys do
-- Adds git related signs to the gutter, as well as utilities for managing changes
return {
  'lewis6991/gitsigns.nvim',
  opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    -- Show inline blame (author · time · summary) at the end of the
    -- current line automatically. Set to false if you prefer on-demand only.
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 300,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> · <summary>',
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Toggle the always-on inline blame virtual text
      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, '[T]oggle git line [b]lame')
      -- Full blame popup for the current line (press again to jump into the commit)
      map('n', '<leader>hb', function()
        gitsigns.blame_line { full = true }
      end, 'git [b]lame line (full)')

      -- Copy the commit hash responsible for the current line to the clipboard
      map('n', '<leader>hy', function()
        local lnum = vim.fn.line '.'
        local dir = vim.fn.expand '%:p:h'
        local file = vim.fn.expand '%:p'
        local out = vim.fn.systemlist { 'git', '-C', dir, 'blame', '-L', lnum .. ',' .. lnum, '--porcelain', file }
        if vim.v.shell_error ~= 0 or not out[1] then
          vim.notify('git blame failed for this line', vim.log.levels.ERROR)
          return
        end
        local hash = out[1]:match '^(%x+)'
        if not hash or hash:match '^0+$' then
          vim.notify('Line not committed yet (uncommitted change)', vim.log.levels.WARN)
          return
        end
        vim.fn.setreg('+', hash)
        vim.notify('Copied commit hash: ' .. hash:sub(1, 12))
      end, 'git blame: [y]ank commit hash')
    end,
  },
}
