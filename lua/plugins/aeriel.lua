return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle" }, -- for code outline
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    layout = {
      default_direction = "prefer_left",
      max_width = { 100, 0.4 },
      min_width = 40,
    },
  },
}
