-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlight" })

-- tabs (buffer)
vim.keymap.set("n", "<C-Tab>", "<cmd>bnext<cr>", { desc = "next buffer" })
-- vim.keymap.set("n", "<C-S-Tab>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })

-- lsp
vim.keymap.set("n", "<leader>cL", "<cmd>LspRestart<cr>", { desc = "Restart LSP" })

-- quickfix list
vim.keymap.set("n", "<leader>xcq", "<cmd>call setqflist([])<cr>", { desc = "Clear quickfix list" })
