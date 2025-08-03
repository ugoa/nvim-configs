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
    custom_highlights = function(colors)
      -- https://catppuccin.com/palette/
      -- https://github.com/catppuccin/nvim/blob/main/lua/catppuccin/palettes/mocha.lua
      return {
        GitSignsCurrentLineBlame = { fg = colors.overlay0 },

        WinSeparator = { fg = colors.surface1 },

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
      }
    end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
