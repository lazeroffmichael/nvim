local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    -- language servers
    "lua_ls",
    "pyright",
    "clangd",
    "jdtls",
})

-- Fix Undefined global 'vim'
lsp.configure("lua_ls", {
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(), -- starts completion
})

-- disable completion with tab / enter
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil
cmp_mappings["<CR>"] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    if client.name == "eslint" then
        vim.cmd.LspStop("eslint")
        return
    end

    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)

    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

    vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)
    vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)
    vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = false,
    update_in_insert = true,
})
