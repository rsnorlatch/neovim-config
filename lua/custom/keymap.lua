-- [[reload neovim configuration]]
vim.keymap.set('n', '<leader>dr', '<cmd>source $NVIM_CONFIG/init.lua<cr>', { desc = 'reloads neovim config without opening and closing neovim' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- [[terminal]

function StartTerminal()
  vim.api.nvim_command '<CMD>term<CR>'

  local term_buffer = vim.api.nvim_get_current_buf()
  local buffer_name = vim.api.nvim_buf_get_name(term_buffer)

  -- TODO: make it so that every terminal buffer name starts with TERM
end

vim.keymap.set('n', '<leader>tt', '<cmd>term<cr>', { desc = 'opens terminal in new tab' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader>we', '<cmd>Oil<cr>', { desc = 'Open Oil directory editor' })

vim.keymap.set('n', '<leader>wc', function()
  local current_buffer = vim.api.nvim_buf_get_name(0)

  if not current_buffer:gmatch 'AppData/Local/nvim' then
    vim.print 'you are trying to reload neovim config while not in a neovim config!'
    return
  end

  vim.cmd('source ' .. current_buffer)
end, { desc = 'Reload neovim config' })
