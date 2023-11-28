---@type ChadrcConfig 
local M = {}

M.ui = {
  theme = 'chadracula',
  transparency = true,
  theme_toggle = {},
}

M.plugins = 'custom.plugins'

M.mappings = require 'custom.mappings'

return M
