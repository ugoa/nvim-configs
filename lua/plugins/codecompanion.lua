return {
  enabled = false,
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
  },
  opts = {
    strategies = {
      chat = {
        adapter = "gemini",
      },
      inline = {
        adapter = "gemini",
      },
      cmd = {
        adapter = "gemini",
      },
    },
    adapters = {
      gemini = function()
        -- API_KEY default from external env GEMINI_API_KEY
        return require("codecompanion.adapters").extend("gemini", {
          schema = {
            model = {
              default = "gemini-2.0-flash",
            },
          },
        })
      end,
    },
  },
  keys = {
    {
      "<M-a>",
      "<cmd>CodeCompanionChat Toggle<CR>",
    },
  },
}
