return {
  {
    "jemag/telescope-diff.nvim",
    dependencies = {
      { "nvim-telescope/telescope.nvim" },
    },
    keys = {
      { "<leader>fC", function() require("telescope").extensions.diff.diff_files({ hidden = true }) end,   desc = "Compare file with current" },
      { "<leader>fc", function() require("telescope").extensions.diff.diff_current({ hidden = true }) end, desc = "Compare 2 files" },
    },
    config = function()
      require("telescope").load_extension("diff")
    end,

  },

}
