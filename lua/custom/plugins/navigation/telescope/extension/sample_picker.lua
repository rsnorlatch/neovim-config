local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values

local colors = function(opts)
  opts = opts or {}

  pickers
    .new(opts, {
      prompt_title = 'colors',
      finder = finders.new_table {
        results = {
          { 'red', 'color red' },
          { 'blue', 'color blue' },
          { 'green', 'color green' },
        },
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
colors()
