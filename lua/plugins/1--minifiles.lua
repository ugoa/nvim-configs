return {
  "echasnovski/mini.files",
  event = "VeryLazy",
  version = "*",
  opts = {
    windows = {
      preview = false,
      width_nofocus = 40,
      width_focus = 40,
      max_number = math.huge,
    },
    mappings = {
      close = "<ESC>",
      synchronize = "<C-S>",
      show_help = "g?",
      mark_goto = "",
      mark_set = "",
      go_in = "",
      go_in_plus = "",
      go_out = "",
      go_out_plus = "",
      reset = "",
      reveal_cwd = "",
      trim_left = "",
      trim_right = "",
    },
  },
  config = function(_, opts)
    local MiniFiles = require("mini.files")
    MiniFiles.setup(opts)

    local go_in_plus = function()
      for _ = 1, vim.v.count1 do
        MiniFiles.go_in({ close_on_file = true })
      end
    end

    local function go_out_plus_till_cwd()
      local p = require("mini.files").get_fs_entry().path
      local parent = vim.fs.dirname(p)
      -- https://github.com/echasnovski/mini.files/blob/main/lua/mini/files.lua#L2143-L2145
      if parent ~= vim.fn.getcwd() then
        for _ = 1, vim.v.count1 do
          MiniFiles.go_out()
          MiniFiles.trim_right()
        end
      end
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniFilesBufferCreate",
      callback = function(args)
        local buf_id = args.data.buf_id
        vim.keymap.set("n", "<M-h>", go_out_plus_till_cwd, { buffer = buf_id })
        vim.keymap.set("n", "<CR>", go_in_plus, { buffer = buf_id })
        vim.keymap.set("n", "<M-l>", go_in_plus, { buffer = buf_id })
      end,
    })
  end,

  keys = {
    {
      "-",
      function()
        local MiniFiles = require("mini.files")
        if not MiniFiles.close() then
          local buf_name = vim.api.nvim_buf_get_name(0)
          local path = vim.fn.filereadable(buf_name) == 1 and buf_name or vim.fn.getcwd()
          MiniFiles.open(path)
          MiniFiles.reveal_cwd()
        end
      end,
      desc = "Toggle Mini Files",
    },
  },
}
