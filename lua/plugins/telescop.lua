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
  }
}
