local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<C-o>:w<CR>", "Save file" },
    ["<C-f>"] = { "<Right>", "Move Right" },
    ["<C-b>"] = { "<Left>", "Move Right" },
  },

  n = {
    ["`"] = { "<Nop>", "Disable backtilde as as it is used as leader key by tmux" },
    ["<F1>"] = { "<Nop>", "Disable F1 key as I don't need help" },

    ["<leader>;"] = { ":", "Enter command mode" },
  }
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
