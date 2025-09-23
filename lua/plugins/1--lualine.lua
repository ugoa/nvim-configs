--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then
      return ""
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
      return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
    end
    return str
  end
end

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
          "minifiles",
          "NvimTree",
          "TelescopePrompt",
          "neo-tree",
          "aerial",
          "checkhealth",
          "NvTerm_float",
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
        { "branch", fmt = trunc(150, 20, nil, false) },
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
        {
          "filename",
          path = 1,
        },
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
