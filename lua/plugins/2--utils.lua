return {
  { "nvim-tree/nvim-web-devicons", opts = {} },

  { "nvim-lua/plenary.nvim" },

  {
    "norcalli/nvim-colorizer.lua",
    cmd = "ColorizerToggle",
    config = true,
    keys = { { "<leader>z", "<cmd>ColorizerToggle<CR>", desc = "Toggle Colorizer" } },
  },

  { "sphamba/smear-cursor.nvim", cmd = { "SmearCursorToggle" }, config = true },

  { "stevearc/quicker.nvim", event = "FileType qf", config = true },

  { "famiu/bufdelete.nvim" },
}
