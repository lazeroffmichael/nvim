local dap = require("dap")

vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>")
vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>")
vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>")

-- Python
local pdap = require("dap-python")
pdap.test_runner = "pytest"
pdap.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")

-- Lua
dap.configurations.lua = {
    {
        type = "nlua",
        request = "attach",
        name = "Attach to running Neovim instance",
    },
}
dap.adapters.nlua = function(callback, config)
  callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
end

-- thank u @chris@machine
vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })

local dapui = require("dapui")
dapui.setup()

local dapvirtual = require("nvim-dap-virtual-text")
dapvirtual.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
