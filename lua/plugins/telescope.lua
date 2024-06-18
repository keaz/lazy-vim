return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        run = "make",
        before = { 'nvim-telescope/telescope.nvim' }
      }
    },
    keys = {
      { "<leader>fl", function() require("telescope.builtin").live_grep() end,                     desc = "Live Grep" },
      { "<leader>ff", function() require("telescope.builtin").find_files() end,                    desc = "Find Files" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end,                       desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end,                     desc = "Help Tags" },
      { "<leader>fr", function() require("telescope.builtin").lsp_references() end,                desc = "References" },
      { "<leader>fD", function() require("telescope.builtin").diagnostics() end,                   desc = "Diagnostics" },
      { "<leader>fd", function() require("telescope.builtin").lsp_definitions() end,               desc = "Definitions" },
      { "<leader>fs", function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, desc = "Dynamic Workspace Symbols" },
      { "<leader>fi", function() require("telescope.builtin").lsp_implementations() end,           desc = "Implementations" },
    },
  
  }