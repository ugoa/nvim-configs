local config = require "nvchad.configs.lspconfig"

local on_attach = config.on_attach
local capabilities = config.capabilities

local options = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  },
}

return options
