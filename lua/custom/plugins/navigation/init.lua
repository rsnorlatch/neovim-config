local telescope = require 'custom.plugins.navigation.telescope.telescope'
local oil = require 'custom.plugins.navigation.oil'
local whichkey = require 'custom.plugins.navigation.oil'

return vim
  .iter({
    telescope,
    oil,
    whichkey,
  })
  :flatten()
  :totable()
