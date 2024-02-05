-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('n', '<leader>e', ':Neotree filesystem reveal left<CR>', {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<cr>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>", { noremap = true, silent = true })
