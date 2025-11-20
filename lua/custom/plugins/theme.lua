return {
  {
    'xiyaowong/transparent.nvim',
    -- config = function()
    --   vim.cmd 'TransparentEnable'
    -- end,
  },
  'Shatur/neovim-ayu',
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
  {
    'rockerBOO/boo-colorscheme-nvim',
    priority = 1000,
    init = function()
      vim.cmd.colorscheme 'forest_stream'
    end,
  },
}
