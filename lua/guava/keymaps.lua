-- a lot of these are courtesy of prime

vim.g.mapleader = " "

-- Netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Save buffer
vim.keymap.set("n", "<leader>w", vim.cmd.w)

-- Delete buffer
vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete)

-- Move visual text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append below lines to the current
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping but keep cursor in the same spot
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Allow no overwrite of buffer when paste
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Copy to system clipboard explictly: asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Delete to void register
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Don't use Q
vim.keymap.set("n", "Q", "<nop>")

-- Quickfix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Easy chmod
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Stay in visual mode when indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Easy sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Easy python running
vim.keymap.set("n", "<leader>rp", "<cmd>!python3 %<CR>")
