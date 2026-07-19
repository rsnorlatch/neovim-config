local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'
-- Source - https://stackoverflow.com/a/27028488
-- Posted by hookenz, modified by community. See post 'Timeline' for change history
-- Retrieved 2026-07-18, License - CC BY-SA 4.0

function dump(o)
  if type(o) == 'table' then
    local s = '{ '
    for k, v in pairs(o) do
      if type(k) ~= 'number' then
        k = '"' .. k .. '"'
      end
      s = s .. '[' .. k .. '] = ' .. dump(v) .. ','
    end
    return s .. '} '
  else
    return tostring(o)
  end
end

function GetActiveTerminal(opts)
  local active_terminal = vim
    .iter(vim.api.nvim_list_bufs())
    :filter(function(bufid)
      return vim.api.nvim_get_option_value('buftype', { buf = bufid }) == 'terminal'
    end)
    :map(function(bufid)
      return { bufid, vim.api.nvim_buf_get_name(bufid) }
    end)
    :totable()

  opts = opts or {}
  pickers
    .new(opts, {
      prompt_title = 'active terminal',

      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()

          if selection == nil then
            print 'no terminal selected'
            return
          end

          vim.api.nvim_command('buffer ' .. selection.value[1])
        end)
        return true
      end,

      finder = finders.new_table {
        results = active_terminal,
        entry_maker = function(entry)
          return {
            value = entry,
            display = entry[2],
            ordinal = entry[1],
          }
        end,
      },

      sorter = conf.generic_sorter(opts),
    })
    :find()
end

-- to execute the function

return {
  GetActiveTerminal,
}
