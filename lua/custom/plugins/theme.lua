return {
  {
    'Shatur/neovim-ayu',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'ayu-dark'
      vim.cmd.hi 'Comment gui=none'
    end,
  },

  {
    'xiyaowong/transparent.nvim',
    config = function()
      vim.cmd 'TransparentEnable'
    end,
  },
  { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('bufferline').setup {
        options = {
          mode = 'tabs',
          separator_style = 'slant',
          always_show_bufferline = false,
          show_buffer_icons = false,
          show_close_icon = false,
          color_icons = true,
        },
      }
    end,
  },
}
