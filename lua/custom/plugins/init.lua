-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'stevearc/oil.nvim',
  opts = {},

  config = function()
    vim.keymap.set('n', '<leader>e', '<C-w>s<C-w>T<cmd>Oil<cr>', { desc = 'Opens Oil explorer on the right side' })
  end,

  dependencies = { { 'echasnovski/mini.icons', opts = {} } },
}
