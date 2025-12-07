return {
  "yetone/avante.nvim",
  cmd = "AvanteToggle",
  enabled = false,
  version = false,
  build = "make",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-telescope/telescope.nvim",
    "hrsh7th/nvim-cmp",
    "nvim-tree/nvim-web-devicons",
    "MeanderingProgrammer/render-markdown.nvim",
    {
      -- Make sure to set this up properly if you have lazy=true
      "MeanderingProgrammer/render-markdown.nvim",
      opts = {
        file_types = { "markdown", "Avante" },
      },
      ft = { "markdown", "Avante" },
    },
  },
  opts = {
    provider = "gemini",
    providers = {
      gemini = {
        model = "gemini-2.0-flash",
      },
    },
    hints = { enabled = false }, -- disable inline keymap hint
    windows = {
      sidebar_header = {
        enabled = false,
      },
      width = 45,
      edit = {
        start_insert = false,
      },
      ask = {
        start_insert = false,
      },
    },
  },

  keys = {
    { "<leader>a", "<cmd>AvanteToggle<CR>", desc = "Toggle AI Assistant" },
  },
}
