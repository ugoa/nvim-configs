require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set
map("i", "<C-s>", "<C-o>:w<CR>", { desc = "Save file" })

map("i", "<C-f>", "<Right>", { desc = "Move right" })
map("i", "<C-b>", "<Left>", { desc = "Move left" })
map("i", "<C-a>", "<Home>", { desc = "Move beginning" })
map("i", "<C-e>", "<End>", { desc = "Move to end" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("n", "<leader>op", ":!open %:p:h<CR>", { desc = "Open in Finder" })
map("n", "<leader>i", ":e ", { desc = "Open file in new buffer" })

map("v", ";", ":", { desc = "CMD enter command mode" })

map("c", "<C-f>", "<Right>", { desc = "Move right" })
map("c", "<C-b>", "<Left>", { desc = "Move left" })
map("c", "<C-a>", "<Home>", { desc = "Move beginning" })
map("c", "<C-e>", "<End>", { desc = "Move to end" })

-- Disable mappings
local nomap = vim.keymap.del
nomap("n", "<leader>v")
nomap("n", "<leader>h")
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")

map("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
map("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
map("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
map("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
