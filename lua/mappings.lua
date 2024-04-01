require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set
local nomap = vim.keymap.del

-- Disable mappings
nomap("n", "<leader>v")
nomap("n", "<leader>h")
nomap("n", "<leader>e")
nomap({ "n", "t" }, "<M-h>")
-- map("n", "q:", "<nop>")
-- map("n", "q/", "<nop>")
-- map("n", "q?", "<nop>")
-- Terminal mode
nomap("t", "<Esc>") -- only use <M-i> for toggle

-- Insert Mode
map("i", "<C-s>", "<C-o>:wa<CR>", { desc = "Save file" })

map("i", "<C-f>", "<Right>", { desc = "Move right" })
map("i", "<C-b>", "<Left>", { desc = "Move left" })
map("i", "<C-a>", "<Home>", { desc = "Move beginning" })
map("i", "<C-e>", "<End>", { desc = "Move to end" })

-- Normal Mode
map("n", "<M-s>", ":silent !open -R %:p<CR>", { desc = "Open in Finder" })
map("n", "<leader>ss", "<Cmd>wa<CR>", { desc = "Save file" })

map("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
map("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
map("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
map("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
map("n", "<M-e>", "<cmd>NvimTreeFocus<CR>", { desc = "Nvimtree Focus window" })

map({ "n", "t" }, "<M-i>", function()
	require("nvchad.term").toggle({ pos = "float", cmd = "git diff", id = "floatTerm" })
end, { desc = "Terminal Toggle Floating term" })
map({ "n", "t" }, "<M-g>", function()
	require("nvchad.term").toggle({ pos = "sp", size = 0.4, id = "split_window" })
end, { desc = "Terminal Terminal" })
map({ "n", "t" }, "<M-v>", function()
	require("nvchad.term").toggle({ pos = "vsp", size = 0.4, id = "vertical_split_window" })
end, { desc = "Terminal vertical Terminal" })

-- Command Mode
map("c", "<C-f>", "<Right>", { desc = "Move right" })
map("c", "<C-b>", "<Left>", { desc = "Move left" })
map("c", "<C-a>", "<Home>", { desc = "Move beginning" })
map("c", "<C-e>", "<End>", { desc = "Move to end" })

-- Visual mode
map("v", "A", ":normal A", { desc = "Append to visual block" })
