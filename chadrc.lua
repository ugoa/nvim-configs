---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "catppuccin",
  transparency = false,

  statusline = {
    theme = "vscode",
  },
}

M.plugins = "custom.plugins"

M.mappings = require "custom.mappings"

return M
