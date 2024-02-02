-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fD", "<cmd>Telescope diagnostics<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", { noremap = true, silent = true })
vim.keymap.set(
  "n",
  "<leader>fs",
  "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
  { noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", { noremap = true, silent = true })

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gh", "<cmd>Gitsigns preview_hunk<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<cr>", { noremap = true, silent = true })
