return {
  { "folke/lazy.nvim",            version = false },
  { "nvim-lua/plenary.nvim" },
  { "nvim-lua/popup.nvim" },
  { "hrsh7th/cmp-nvim-lua" },
  { "cmp-nvim-lsp-signature-help" },
  { "L3MON4D3/LuaSnip" },
  {
    "LazyVim/LazyVim",
    dependencies = {
      {
        "folke/tokyonight.nvim",
      },
      {
        "catppuccin/nvim",
        version = false,
        config = function()
          require("catppuccin").setup({
            term_colors = true,
            integrations = {
              treesitter = true,
            },
          })
        end
      },
    },
    version = false,
    opts = {
      colorscheme = "tokyonight",
    },
  },
}

