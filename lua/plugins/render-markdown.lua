return {
  -- Make sure to set this up properly if you have lazy=true
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    enabled = false,
  },
  keys = {
    { "<leader>v", "<cmd>RenderMarkdown buf_toggle<CR>", desc = "Toggle Markdown Preview" },
  },
}
