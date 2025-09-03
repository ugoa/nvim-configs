return {
  "stevearc/conform.nvim",
  event = { "BufWritePre", "VeryLazy" },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format", "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      javascriptreact = { "prettier" },
      -- json = { "prettier" },
      -- vue = { "prettier" },
      html = { "djlint" },
      htmldjango = { "djlint" },
    },
    format_on_save = function(bufnr)
      local filetype = vim.bo[bufnr].filetype
      -- Disable with a global or buffer-local variable
      -- or for html/htmldjango filetype
      if
        vim.g.disable_autoformat
        or vim.b[bufnr].disable_autoformat
        or filetype == "html"
        or filetype == "htmldjango"
      then
        return
      end

      return {
        timeout_ms = 10000,
        lsp_fallback = true,
      }
    end,
  },

  config = function(_, opts)
    require("conform").setup(opts)

    require("conform").formatters.djlint = function(_bufnr)
      return {
        command = "djlint",
        -- args = { "--format-js", "--format-css", "--reformat", "-" },
        args = { "--reformat", "-" },
        cwd = require("conform.util").root_file({ "djlint.toml" }),
      }
    end

    vim.api.nvim_create_user_command("FormatToggle", function(args)
      local is_global = not args.bang
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      if vim.g.disable_autoformat then
        vim.notify("Autoformat-on-save Disabled globally", vim.log.levels.WARN)
      else
        vim.notify("Autoformat-on-save Enabled globally", vim.log.levels.INFO)
      end
    end, {
      desc = "Toggle autoformat-on-save",
      bang = true,
    })
  end,
}
