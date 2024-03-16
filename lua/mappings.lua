require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("i", "<C-s>", "<C-o>:w<CR>", { desc = "Save file" })
map("i", "<C-f>", "<Right>", { desc = "Move right" })
map("i", "<C-b>", "<Left>", { desc = "Move left" })
map("i", "<F1>", "<Nop>", { desc = "Disable" })

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("n", "`", "<Nop>", { desc = "Disable" })
map("n", "<F1>", "<Nop>", { desc = "Disable" })
