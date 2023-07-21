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

-- tmux navigation
vim.keymap.del("n", "<C-h>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.del("n", "<C-l>")
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Window Left" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Window Right" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Window Up" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Window Right" })

-- Vertical and horizontal do not map the initial way you think they do
vim.keymap.set("n", "<leader>wj", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<leader>wk", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<leader>wl", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<leader>wh", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })
