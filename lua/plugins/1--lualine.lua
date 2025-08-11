return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  after = "catppuccin",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "catppuccin",
      disabled_filetypes = {
        statusline = {
          "noice",
          "Avante",
          "AvanteInput",
          "AvanteSelectedFiles",
          "DressingInput",
          "undefined",
          "minifiles",
          "NvimTree",
          "TelescopePrompt",
          "NvTerm_float",
          "neo-tree",
          "aerial",
          "checkhealth",
          "NvTerm_vsp",
          "NvTerm_sp",
          "checkhealth",
          "fugitive*",
          "git",
          "lspinfo",
          "netrw",
          "notify",
          "query",
          "grug-far",
        },
        winbar = { "aerial", "checkhealth", "help" },
      },
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = {
        "branch",
        "diff",
        "diagnostics",
        {
          function()
            local venv_path = os.getenv("VIRTUAL_ENV")
            if venv_path then
              -- Extract the last part of the path, which is usually the venv name
              return vim.fn.fnamemodify(venv_path, ":t")
            else
              return "" -- Or a default string like "No Venv"
            end
          end,
        },
      },
      lualine_c = {
        { "filename", path = 1 },
        { "filetype" },
      },
      lualine_x = {
        { "progress", separator = "" },
        { "location", separator = "" },
        {
          function() return vim.fn.line("$") .. "L" end,
          separator = "",
        },
      },
      lualine_y = {
        {
          -- show total buffer numbers
          function()
            local count = 0
            for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
              if vim.api.nvim_get_option_value("buflisted", { buf = bufnr }) then count = count + 1 end
            end
            return " " .. count
          end,
        },

        {
          -- show lsp_client
          function()
            if rawget(vim, "lsp") then
              for _, client in ipairs(vim.lsp.get_clients()) do
                local stbufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid or 0)
                if client.attached_buffers[stbufnr] then return "  " .. client.name end
              end
            end
            return ""
          end,
        },
      },
      lualine_z = {
        {
          function()
            -- return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
            local cwd = vim.fn.getcwd()
            local home_dir = vim.fn.expand("~")

            if string.find(cwd, home_dir, 1, true) == 1 then
              -- CWD is within the home directory, so remove the home_dir prefix
              local relative_path = string.sub(cwd, string.len(home_dir) + 2)
              if relative_path == "" then
                -- If CWD is exactly the home directory, the relative path is "."
                relative_path = "."
              end
              return "~/" .. relative_path
            else
              -- CWD is outside the home directory, so the relative path is just the CWD
              return cwd
            end
          end,
        },
      },
    },
    inactive_sections = {
      lualine_c = { { "filename", path = 1 } },
    },
  },
}
