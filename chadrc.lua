---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "chadracula",
  transparency = false,

  statusline = {
    theme = "vscode",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
