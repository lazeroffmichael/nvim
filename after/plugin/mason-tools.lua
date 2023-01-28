local masontools = require("mason-tool-installer")

local servers = {
    -- DAP Adapters
    -- Linters
    "flake8",
    -- Formatters
    "stylua",
    "black",
    "clang-format"
}

masontools.setup({
    ensure_installed = servers,
    auto_update = true,
    run_on_start = true,
})
