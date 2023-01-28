local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        -- linters
        null_ls.builtins.diagnostics.flake8,
        -- formatters
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.black,
    },
})
