return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "ugoa/telescope-recent-files.nvim",
  },

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
          "--glob=!**/target/*",
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
        "--glob=!**/target/*",
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
          preview_height = 0.55,
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
          ["<M-j>"] = function(prompt_bufnr)
            local action_state = require("telescope.actions.state")
            local picker = action_state.get_current_picker(prompt_bufnr)
            local prompt_win = picker.prompt_win
            local previewer = picker.previewer
            local winid = previewer.state.winid
            local bufnr = previewer.state.bufnr
            vim.keymap.set(
              "n",
              "<M-k>",
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

  config = function(_, opts)
    require("telescope").setup(opts)
    require("telescope").load_extension("recent-files")
  end,

  keys = {
    -- { "<M-f>", "<cmd>Telescope find_files<CR>" },
    {
      "<M-f>",
      function()
        require("telescope").extensions["recent-files"].recent_files({
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
        })
      end,
    },

    { "<M-S-f>", "<cmd>Telescope live_grep<CR>" },

    { "<M-u>", "<cmd>Telescope git_status<CR>" },

    { "<M-n>", "<cmd>Telescope git_commits<CR>" },

    {
      "<leader>gi",
      function() require("telescope.builtin").lsp_implementations() end,
      desc = "LSP: Find implementations",
    },

    -- { "<M-b>", "<cmd>Telescope buffers sort_mru=true ignore_current_buffer=true<CR>" },
    {
      "<leader>gw",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols({
          fname_width = 90,
          symbol_width = 35,
          symbol_type_width = 15,
        })
      end,
      desc = "LSP: Find workspace symbols",
    },
    {
      "<leader>gr",
      function() require("telescope.builtin").lsp_references() end,
      desc = "LSP: find references",
    },
    {
      "<M-r>",
      function() require("telescope.builtin").lsp_references() end,
      desc = "LSP: find references",
    },
  },
}
