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
local first_term_buf = nil
function StartTerminal()
  vim.api.nvim_command 'term'

  buf = vim.api.nvim_get_current_buf()

  if not first_term_buf then
    first_term_buf = buf
  end
end

function GoToFirstTerm()
  vim.api.nvim_command('b ' .. first_term_buf)
end

vim.keymap.set('n', '<leader>tt', StartTerminal, { desc = 'opens terminal in new tab' })
vim.keymap.set('n', '<leader>tg', GoToFirstTerm, { desc = 'open last opened terminal' })

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

vim.keymap.set('n', 's', 'xa', { desc = 'Similar to x but you enter insert mode afterward' })

vim.keymap.set('n', '<leader>wc', function()
  local current_buffer = vim.api.nvim_buf_get_name(0)

  if not current_buffer:gmatch 'AppData/Local/nvim' then
    vim.print 'you are trying to reload neovim config while not in a neovim config!'
    return
  end

  vim.cmd('source ' .. current_buffer)
end, { desc = 'Reload neovim config' })
