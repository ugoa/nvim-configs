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
        NvimTreeCursorLine = { fg = colors.green, bg = colors.surface1, bold = true },
        NvimTreeOpenedHL = { fg = colors.text },

        GitSignsCurrentLineBlame = { fg = colors.overlay0 },

        MiniFilesTitleFocused = { bold = true, fg = colors.green },
        MiniFilesCursorLine = { bg = colors.surface0, fg = colors.teal },

        -- WinBar = { fg = colors.teal },

        WinSeparator = { fg = colors.surface1 },
        AvanteSidebarWinSeparator = { fg = colors.surface1 },
        AvanteSidebarWinHorizontalSeparator = { fg = colors.surface1 },
        NvimTreeWinSeparator = { fg = colors.surface1 },
        NeoTreeWinSeparator = { fg = colors.surface1 },

        BookMarksAdd = { fg = "#73747e" },
        BookMarksAnn = { fg = "#73747e" },

        ["@keyword"] = { italic = true, fg = colors.mauve },
        ["@keyword.function"] = { italic = true },
        ["@keyword.return"] = { italic = true, fg = colors.mauve },
        ["@keyword.conditional"] = { italic = true, fg = colors.mauve },
        ["@keyword.operator"] = { italic = true, fg = colors.mauve },
        ["@keyword.repeat"] = { italic = true, fg = colors.mauve },

        ["@variable.builtin"] = { italic = true, fg = colors.maroon },
        -- ["@variable.repeat"] = { italic = true, fg = colors.mauve },
        -- ["@variable.conditional"] = { italic = true, fg = colors.mauve },
        -- ["@variable.operator"] = { italic = true, fg = colors.mauve },

        -- Set color for fields in Rust struct, or Python classes, etc
        -- ["@variable.member"] = { italic = true, fg = colors.lavender }, -- treesitter
        -- ["@property"] = { fg = colors.lavender }, -- lsp

        -- ["@constant.builtin"] = { italic = true, fg = colors.mauve },

        -- ["@type.builtin"] = { italic = true, fg = colors.mauve },

        Keyword = { italic = true, fg = colors.mauve },
        Include = { italic = true, fg = colors.mauve },
        Boolean = { italic = true, fg = colors.mauve },
        Statement = { italic = true, fg = colors.mauve },
        Conditional = { italic = true, fg = colors.mauve },
        Repeat = { italic = true },
      }
    end,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
