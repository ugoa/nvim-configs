local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<C-o>:w<CR>", "Save file" },
    ["<C-f>"] = { "<Right>", "Move Right" },
    ["<C-b>"] = { "<Left>", "Move Right" },
  },
}

M.comment = {

  i = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  -- toggle comment in both modes
  n = {
    ["<C-_>"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

return M
