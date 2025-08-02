return {
  { "nvim-tree/nvim-web-devicons", opts = {} },

  "nvim-lua/plenary.nvim",

  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        enabled = true,
      },
      select = {
        enabled = true,
        backend = { "telescope", "builtin" },
        telescope = require("telescope.themes").get_cursor(),
      },
    },
  },

  { "norcalli/nvim-colorizer.lua", cmd = "ColorizerToggle", opts = {} },
}
