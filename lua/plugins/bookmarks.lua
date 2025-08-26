return {
  "tomasky/bookmarks.nvim",
  event = "VeryLazy",
  after = "telescope.nvim",
  config = function()
    require("bookmarks").setup({

      -- sign_priority = 8,  --set bookmark sign priority to cover other sign
      save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
      on_attach = function(_bufnr)
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n", "mm", bm.bookmark_ann) -- add or edit mark annotation at current line
        map("n", "mi", bm.bookmark_toggle) -- add or remove bookmark at current line
        map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
        map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
        map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
        map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
        map("n", "mx", bm.bookmark_clear_all) -- removes all bookmarks
      end,
    })
    require("telescope").load_extension("bookmarks")
  end,
  keys = {
    { "<M-m>", "<cmd>Telescope bookmarks list<CR>" },
  },
}
