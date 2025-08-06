return {
  "MagicDuck/grug-far.nvim",
  event = "VeryLazy",
  opts = {
    engines = {
      ripgrep = {
        defaults = {
          flags = "-i",
        },
      },
    },
  },
  keys = { { "<M-;>", function() require("grug-far").open({ transient = true }) end } },
}
