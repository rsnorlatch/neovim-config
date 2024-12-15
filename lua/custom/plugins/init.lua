local navigation = require 'custom.plugins.navigation'
local theme = require 'custom.plugins.theme'
local formatting = require 'custom.plugins.formatting'
local lsp = require 'custom.plugins.lsp'
local treesitter = require 'custom.plugins.tree-sitter'
local editing = require 'custom.plugins.editing'
local util = require 'custom.plugins.util'

return vim
  .iter({
    navigation,
    theme,
    formatting,
    lsp,
    treesitter,
    editing,
    util,
  })
  :flatten()
  :totable()
