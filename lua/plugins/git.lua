return {
    {
      "tpope/vim-fugitive",
      --    keys = {
      --      { "<leader>ga", function() require("fugitive").add(".") end, desc = "Git add" },
      --      { "<leader>gc", function() require("fugitive").commit() end, desc = "Git commit" }
      --    }
    },
    {
      "lewis6991/gitsigns.nvim",
      keys = {
        { "<leader>gh", function() require("gitsigns").preview_hunk() end,              desc = "Preview Hunk" },
        { "<leader>gb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle Current Line Blame" },
        { "<leader>gB", function() require("gitsigns").blame_line() end,                desc = "Line Blame" },
      },
      config = function()
        require("gitsigns").setup()
      end
    }
  }