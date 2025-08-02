return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",

  opts = {
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 0,
      ignore_whitespace = true,
      virt_text_priority = 700,
    },
    signs = {
      delete = { text = "󰍵" },
      changedelete = { text = "󱕖" },
    },
  },
}
