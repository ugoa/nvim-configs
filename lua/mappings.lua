require("nvchad.mappings")

-- add yours here
local map = vim.keymap.set
local del = vim.keymap.del

-- Disable mappings
del("n", "<leader>v")
del("n", "<leader>h")
del("n", "<leader>e")
del({ "n", "t" }, "<M-h>")
-- del("n", "q:", "<nop>")
-- del("n", "q/", "<nop>")
-- del("n", "q?", "<nop>")
-- Disable mappings
del("n", "<C-h>")
del("n", "<C-j>")
del("n", "<C-k>")
del("n", "<C-l>")

del("n", "<leader>n")
del("n", "<leader>rn")
map("n", "<leader>nn", "<cmd>set nu!<CR>", { desc = "toggle line number" })
map("n", "<leader>nt", "<cmd>set rnu!<CR>", { desc = "toggle relative number" })

-- JUST FOR SAVE!
-- Create a new keyboard shortcut in Iterm2:
--      Shortcut: cmd-s
--      Action: Send Escape Sequence
--      Esc+: [17~
map("i", "<F6>", "<Esc>:wa<CR>", { desc = "save file" })
map("i", "<C-s>", "<Esc>:wa<CR>", { desc = "save file" })
map("n", "<F6>", "<Cmd>:wa<CR>", { desc = "save file" })

map({ "i", "c" }, "<C-f>", "<Right>", { desc = "move right" })
map({ "i", "c" }, "<C-b>", "<Left>", { desc = "move left" })
map({ "i", "c" }, "<C-a>", "<Home>", { desc = "move beginning" })
map({ "i", "c" }, "<C-e>", "<End>", { desc = "move to end" })

-- Normal Mode
map("n", "<M-r>", "<Cmd>SessionSave<CR>", { desc = "save nvim session" })
map("n", "<M-y>", "<Cmd>:%y+<CR>", { desc = "copy whole file" })

map("n", "<M-h>", "<Cmd>NvimTmuxNavigateLeft<CR>")
map("n", "<M-j>", "<Cmd>NvimTmuxNavigateDown<CR>")
map("n", "<M-k>", "<Cmd>NvimTmuxNavigateUp<CR>")
map("n", "<M-l>", "<Cmd>NvimTmuxNavigateRight<CR>")
map("n", "<M-e>", "<cmd>NvimTreeFocus<CR>", { desc = "focus nvimtree" })

map({ "n", "t" }, "<M-i>", function()
	require("nvchad.term").toggle({ pos = "float", id = "floatTerm" })
end, { desc = "toggle floating terminal" })
map({ "n", "t" }, "<M-b>", function()
	require("nvchad.term").toggle({ pos = "sp", size = 0.4, id = "split_window" })
end, { desc = "toggle horizontal terminal" })
map({ "n", "t" }, "<M-v>", function()
	require("nvchad.term").toggle({ pos = "vsp", size = 0.4, id = "vertical_split_window" })
end, { desc = "toggle vertical terminal" })

del("n", "<leader>x")

map("n", "<leader>kk", function()
	require("nvchad.tabufline").close_buffer()
end, { desc = "close current buffer" })
map("n", "<leader>ko", function()
	require("nvchad.tabufline").closeOtherBufs()
end, { desc = "close other buffers" })
map("n", "<leader>kl", function()
	require("nvchad.tabufline").closeBufs_at_direction("left")
end, { desc = "close buffers on the left side" })
map("n", "<leader>kr", function()
	require("nvchad.tabufline").closeBufs_at_direction("right")
end, { desc = "close buffers on the right side" })
map("n", "<leader>ka", function()
	require("nvchad.tabufline").closeAllBufs()
end, { desc = "close all buffers" })

map("n", "<M-s>", ":silent !open -R %:p<CR>", { desc = "Open in Finder" })

-- -- Command Mode
-- map("c", "<C-f>", "<Right>", { desc = "move right" })
-- map("c", "<C-b>", "<Left>", { desc = "move left" })
-- map("c", "<C-a>", "<Home>", { desc = "move beginning" })
-- map("c", "<C-e>", "<End>", { desc = "move to end" })

-- Visual mode
map("v", "A", ":normal A", { desc = "append to visual block" })

-- Open file out of current FS scope
map("n", "<leader>b", ":edit ", { desc = "Edit file in new buffer" })

map("n", "<leader>h", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hint" })
