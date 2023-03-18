local packer = require("packer")

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

return packer.startup(function(use)
    -- Packer can manage itself
    use({ "wbthomason/packer.nvim" })

    -- Telescope: Fuzzy Finding
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.x",
        requires = { { "nvim-lua/plenary.nvim" } },
    })

    -- Colorscheme
    use({ "navarasu/onedark.nvim" })

    -- Treesitter: Advanced Syntax Highlighting
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- Harpoon: Per Project, File Navigation
    use({ "theprimeagen/harpoon" })

    -- Undotree: Edit history
    use({ "mbbill/undotree" })

    -- LSP Zero: LSP and Completion
    use({
        "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },

            -- Autocompletion
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            { "saadparwaiz1/cmp_luasnip" },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },

            -- Snippets
            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        },
    })

    -- Mason Tool Installer: Used for auto installing DAP Adapters, Linters, Formatters
    use({ "WhoIsSethDaniel/mason-tool-installer.nvim" })

    -- Nvim-Dap: DAP Wrapper For Neovim
    -- Note: nvim-dap doesn't actually require these, but these are useful
    use({
        "mfussenegger/nvim-dap",
        requires = {
            -- UI Support
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },

            -- Per Language Setup
            { "mfussenegger/nvim-dap-python" },
            { "jbyuki/one-small-step-for-vimkind" }, -- Lua
        },
    })

    -- Null-LS: Formatting and Linting
    use({ "jose-elias-alvarez/null-ls.nvim" })

    -- Autopairs: Auto place matching paren or brace
    use({ "windwp/nvim-autopairs" })

    -- Comment: Easily comment and uncomment
    use({ "numToStr/Comment.nvim" })

    -- Lualine: Status line
    use({ "nvim-lualine/lualine.nvim" })

    -- GitSigns: Git sign integration in buffer
    use({ "lewis6991/gitsigns.nvim" })

    -- Markdown Preview
    use({
        "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    })

    -- Web Dev Icons: Good Icons (Mostly for dap ui)
    use({ "nvim-tree/nvim-web-devicons" })

    -- nvim-tree: File Explorer
    use({
        "nvim-tree/nvim-tree.lua",
        tag = "nightly", -- optional, updated every week. (see issue #1193)
    })

    -- Git integration
    use({
        "tpope/vim-fugitive",
    })
end)
