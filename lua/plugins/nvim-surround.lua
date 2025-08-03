return {
  -- https://github.com/kylechui/nvim-surround?tab=readme-ov-file#rocket-usage
  "kylechui/nvim-surround",
  version = "^3.1.3",
  event = "VeryLazy",
  opts = {
    keymaps = {
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "ys",
      normal_cur = "yss",
      normal_line = "yS",
      normal_cur_line = "ySS",
      visual = "S",
      visual_line = "gS",
      delete = "ds",
      change = "cs",
      change_line = "cS",
    },
  },
}
