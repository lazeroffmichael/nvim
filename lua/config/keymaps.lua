-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- The alt key is mapped to escape in normal terminals
vim.keymap.set("n", "<A-j>", "<nop>")
vim.keymap.set("n", "<A-k>", "<nop>")
vim.keymap.set("i", "<A-k>", "<nop>")
vim.keymap.set("i", "<A-j>", "<nop>")
vim.keymap.set("v", "<A-j>", "<nop>")
vim.keymap.set("v", "<A-k>", "<nop>")
vim.keymap.set("i", "<A-k>", "<nop>")
vim.keymap.set("i", "<A-j>", "<nop>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Text Up", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Text Down", silent = true })
vim.keymap.set("n", "J", "mzJ`z", { desc = "Append Below Lines To Current", silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Jump Down Half Page", silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Jump Up Half Page", silent = true })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste But Don't Save", silent = true })
-- credit: asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank To System Clipboard", silent = true })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete To Void Register", silent = true })
vim.keymap.set("n", "Q", "<nop>", { desc = "Don't Use Q" })
vim.keymap.set("n", "<leader>rp", "<cmd>!python3 %<CR>", { desc = "Run Python File", silent = true })
