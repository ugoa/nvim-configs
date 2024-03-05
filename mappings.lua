local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<C-o>:w<CR>", "Save file" },
    ["<C-f>"] = { "<Right>", "Move Right" },
    ["<C-b>"] = { "<Left>", "Move Right" },
    ["<F1>"] = { "<Nop>", "Disable F1 key as I don't need help" },
  },

  n = {
    ["`"] = { "<Nop>", "Disable backtilde as as it is used as leader key by tmux" },
    ["<F1>"] = { "<Nop>", "Disable F1 key as I don't need help" },

    ["<leader>;"] = { ":", "Enter command mode" },
    ["<leader>op"] = { ":!open %:p:h<CR>", "Open in Finder" },
  },
}

return M
