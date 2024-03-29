require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set
local nomap = vim.keymap.del

-- Disable mappings
nomap("n", "<leader>v")
nomap("n", "<leader>h")
nomap("n", "<leader>e")
nomap("n", "<C-h>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<C-l>")
map("n", "q:", "<nop>")
map("n", "q/", "<nop>")
map("n", "q?", "<nop>")

-- Insert Mode
map("i", "<C-s>", "<C-o>:w<CR>", { desc = "Save file" })

map("i", "<C-f>", "<Right>", { desc = "Move right" })
map("i", "<C-b>", "<Left>", { desc = "Move left" })
map("i", "<C-a>", "<Home>", { desc = "Move beginning" })
map("i", "<C-e>", "<End>", { desc = "Move to end" })

-- Normal Mode
map("n", "<M-s>", ":silent !open -R %:p<CR>", { desc = "Open in Finder" })

map("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
map("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
map("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
map("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
map("n", "<M-e>", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

-- Command Mode
map("c", "<C-f>", "<Right>", { desc = "Move right" })
map("c", "<C-b>", "<Left>", { desc = "Move left" })
map("c", "<C-a>", "<Home>", { desc = "Move beginning" })
map("c", "<C-e>", "<End>", { desc = "Move to end" })
