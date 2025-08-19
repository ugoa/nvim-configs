return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  after = "catppuccin",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
}
