return {
  "stevearc/aerial.nvim",
  cmd = { "AerialToggle" }, -- for code outline
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  opts = {
    layout = {
      default_direction = "prefer_right",
      max_width = { 100, 0.4 },
      min_width = 40,
    },
  },
  keys = { { "<M-o>", "<cmd>AerialToggle<CR>" } },
}
