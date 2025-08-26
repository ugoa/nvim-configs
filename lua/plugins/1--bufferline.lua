return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  after = "catppuccin",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "famiu/bufdelete.nvim",
  },
  config = function()
    vim.opt.winbar = nil
    require("bufferline").setup({
      options = {
        themable = true, -- allow override by themes
        separator_style = "slant",
        truncate_names = false,
        offsets = { { filetype = "NvimTree", text = "File Explorer", text_align = "center" } },
      },
      highlights = require("catppuccin.groups.integrations.bufferline").get({ styles = { "bold" } }),
    })
  end,
  keys = {
    {
      "<leader>k",
      function() require("bufdelete").bufdelete() end,
      desc = "close current buffer",
    },
    {
      "<leader>l",
      "<cmd>BufferLineCloseLeft<cr>",
      desc = "close current at left",
    },
    {
      "<leader>r",
      "<cmd>BufferLineCloseRight<cr>",
      desc = "close current at right",
    },
    {
      "<leader>o",
      "<cmd>BufferLineCloseOthers<cr>",
    },
    {
      "<leader>a",
      function()
        vim.cmd([[BufferLineCloseOthers]])
        require("bufdelete").bufdelete()
      end,
      desc = "close all buffers",
    },
  },
}
