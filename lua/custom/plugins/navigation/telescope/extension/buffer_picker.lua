local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local devicons = require 'nvim-web-devicons'

function BufferPicker(opts)
  local opts = opts or {}

  local buffers = vim
    .iter(vim.api.nvim_list_bufs())
    :filter(function(bufid)
      return vim.api.nvim_buf_is_loaded(bufid)
    end)
    :filter(function(bufid)
      return vim.api.nvim_get_option_value('buftype', { buf = bufid }) ~= 'terminal'
    end)
    :filter(function(bufid)
      return vim.api.nvim_buf_get_name(bufid) ~= ''
    end)
    :map(function(bufid)
      return { bufid, vim.api.nvim_buf_get_name(bufid) }
    end)
    :totable()

  pickers
    .new(opts, {
      prompt_title = 'buffers',

      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()

          if selection == nil then
            print 'no terminal selected'
            return
          end

          local selected_buffer_id = selection.value[1]

          vim.api.nvim_command('buffer ' .. selected_buffer_id)
        end)

        return true
      end,

      finder = finders.new_table {
        results = buffers,

        entry_maker = function(entry)
          local name = vim.fn.fnamemodify(entry[2], ':t')
          local ext = vim.fn.fnamemodify(entry[2], ':e')
          local icon, hl = devicons.get_icon(name, ext, { default = true })
          local display = entry[1] .. ' ' .. icon .. ' ' .. entry[2]

          return {
            value = entry,
            path = entry[2],
            display = display,
            ordinal = entry[2],
            highlight = {
              { 0, 0, #tostring(entry[1]), 'Number' },
              { 0, 0, #icon, hl },
            },
          }
        end,
      },

      previewer = conf.file_previewer(opts),

      sorter = conf.generic_sorter(opts),
    })
    :find()
end

return {
  BufferPicker = BufferPicker,
}
