-- setup already called in packer.lua

-- run command from everywhere
vim.g.mkdp_command_for_global = 1

vim.keymap.set("n", "<leader>mp", "<Plug>MarkdownPreviewToggle")
