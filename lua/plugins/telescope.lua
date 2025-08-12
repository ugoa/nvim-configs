return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },

  opts = {
    pickers = {
      -- For find_files
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--smart-case",
          "--hidden",
          "--no-ignore",
          "--glob=!.DS_Store",
          "--glob=!project/*/*",
          "--glob=!target/*",
          "--glob=!**/.github/*",
          "--glob=!**/.cargo*",
          "--glob=!**/.vscode*",
          "--glob=!**/.idea/*",
          "--glob=!**/.venv/*",
          "--glob=!**/.git/*",
          "--glob=!**/log/*",
          "--glob=!**/logs/*",
          "--glob=!**/tmp*",
          "--glob=!**/temp/*",
          "--glob=!**/.nuxt*",
          "--glob=!**/node_modules/*",
          "--glob=!**/.output*",
          "--glob=!**/.vinxi/*",
          "--glob=!**/__pycache__/*",
          "--glob=!**/dist/*",
          "--glob=!**/db-data/*",
          "--glob=!**/.bsp/*",
        },
      },
    },

    defaults = {
      -- For live_grep
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--trim",
        "--smart-case",
        "--hidden",
        "--no-ignore",
        "--glob=!.DS_Store",
        "--glob=!project/*/*",
        "--glob=!target/*",
        "--glob=!**/.github/*",
        "--glob=!**/.cargo*",
        "--glob=!**/.vscode*",
        "--glob=!**/.idea/*",
        "--glob=!**/.venv/*",
        "--glob=!**/.git/*",
        "--glob=!**/log/*",
        "--glob=!**/logs/*",
        "--glob=!**/tmp*",
        "--glob=!**/temp/*",
        "--glob=!**/.nuxt*",
        "--glob=!**/node_modules/*",
        "--glob=!**/.output*",
        "--glob=!**/.vinxi/*",
        "--glob=!**/__pycache__/*",
        "--glob=!**/dist/*",
        "--glob=!**/db-data/*",
        "--glob=!**/.bsp/*",
      },

      sorting_strategy = "ascending",
      layout_strategy = "vertical",
      layout_config = {
        vertical = {
          prompt_position = "top",
          mirror = true,
          size = {
            width = "100%",
            height = "100%",
          },
        },
        horizontal = {
          prompt_position = "top",
          preview_width = 0.55,
          size = {
            width = "90%",
            height = "90%",
          },
        },
      },
      mappings = {
        i = {
          ["<Esc>"] = require("telescope.actions").close,
          -- Move focus between prompt and preview window
          -- https://github.com/nvim-telescope/telescope.nvim/issues/2778#issuecomment-2480852286
          ["<M-k>"] = function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local picker = action_state.get_current_picker(prompt_bufnr)
            local prompt_win = picker.prompt_win
            local previewer = picker.previewer
            local winid = previewer.state.winid
            local bufnr = previewer.state.bufnr
            vim.keymap.set(
              "n",
              "<M-j>",
              function() vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", prompt_win)) end,
              { buffer = bufnr }
            )
            vim.keymap.set(
              "n",
              "<Esc>",
              function() require("telescope.actions").close(prompt_bufnr) end,
              { buffer = bufnr }
            )
            vim.keymap.set(
              "n",
              "q",
              function() require("telescope.actions").close(prompt_bufnr) end,
              { buffer = bufnr }
            )
            vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", winid))
          end,
        },
      },
    },
    extensions_list = { "themes", "terms" },
    extensions = {},
  },

  keys = {
    { "<M-f>", "<cmd>Telescope find_files<CR>" },
    { "<M-g>", "<cmd>Telescope live_grep<CR>" },
  },
}
