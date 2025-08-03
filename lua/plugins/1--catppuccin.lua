return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = "latte",
      dark = "mocha",
    },
    auto_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = {
        enabled = true,
        transparent = false,
      },
      nvimtree = true,
      treesitter = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = "",
      },
    },
    custom_highlights = {
      GitSignsCurrentLineBlame = { fg = "#73747e" },

      WinSeparator = { fg = "#73747e" },

      BookMarksAdd = { fg = "#73747e" },
      BookMarksAnn = { fg = "#73747e" },

      ["@keyword"] = { italic = true },
      ["@keyword.function"] = { italic = true },
      ["@keyword.return"] = { italic = true },
      ["@keyword.conditional"] = { italic = true },
      ["@keyword.operator"] = { italic = true },
      ["@keyword.repeat"] = { italic = true },
      ["@variable.builtin"] = { italic = true },
      ["@variable.repeat"] = { italic = true },
      ["@variable.conditional"] = { italic = true },
      ["@variable.operator"] = { italic = true },

      ["@constant.builtin"] = { italic = true },
      ["@type.builtin"] = { italic = true },

      Keyword = { italic = true },
      Include = { italic = true },
      Boolean = { italic = true },
      Statement = { italic = true },
      Conditional = { italic = true },
      Repeat = { italic = true },
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd([[colorscheme catppuccin]])
  end,
}
