local ls = require 'luasnip'

local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet

ls.add_snippet('php', {
  s('php', {
    '<?php ',
    i(1),
    '?>',
  }),
})
