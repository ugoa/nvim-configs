return {
  { "nvim-tree/nvim-web-devicons", opts = {} },

  { "nvim-lua/plenary.nvim" },

  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
    keys = { { "<leader>z", "<cmd>ColorizerToggle<CR>" } },
  },

  { "sphamba/smear-cursor.nvim", cmd = { "SmearCursorToggle" }, opts = {} },

  { "stevearc/quicker.nvim", event = "FileType qf", opts = {} },
}
