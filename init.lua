-------------------------------------------------------------------------------
--              _   _
--   ___  _ __ | |_(_) ___  _ __  ___
--  / _ \| '_ \| __| |/ _ \| '_ \/ __|
-- | (_) | |_) | |_| | (_) | | | \__ \
--  \___/| .__/ \__|_|\___/|_| |_|___/
--       |_|
--
-- options: Place all of your neovim options here!
-------------------------------------------------------------------------------

vim.opt.guicursor = ""
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.colorcolumn = "80"

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = "yes:2"

vim.opt.conceallevel = 0

vim.opt.updatetime = 50

-- autocmd is needed since a plugin is resetting the formatting table each time
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- disable netrw in favor of nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-------------------------------------------------------------------------------
--  _
-- | | _____ _   _ _ __ ___   __ _ _ __  ___
-- | |/ / _ \ | | | '_ ` _ \ / _` | '_ \/ __|
-- |   <  __/ |_| | | | | | | (_| | |_) \__ \
-- |_|\_\___|\__, |_| |_| |_|\__,_| .__/|___/
--           |___/                |_|
--
-- keymaps: Well all of your keymaps go here of course
--
-- note: almost all of these are from theprimeagen
-------------------------------------------------------------------------------

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", ":NvimTreeToggle<CR>", {
    desc = "File Tree",
})

vim.keymap.set("n", "<leader>w", vim.cmd.w, {
    desc = "Save Buffer",
})

vim.keymap.set("n", "<leader>bd", vim.cmd.bdelete, {
    desc = "Delete Buffer",
})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {
    desc = "Move Text Up",
})

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {
    desc = "Move Text Down",
})

vim.keymap.set("n", "J", "mzJ`z", {
    desc = "Append Below Lines To Current",
})

vim.keymap.set("n", "<C-d>", "<C-d>zz", {
    desc = "Jump Down Half Page",
})

vim.keymap.set("n", "<C-u>", "<C-u>zz", {
    desc = "Jump Up Half Page",
})

vim.keymap.set("x", "<leader>p", [["_dP]], {
    desc = "Paste But Don't Save",
})

-- credit: asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {
    desc = "Yank To System Clipboard",
})

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {
    desc = "Delete To Void Register",
})

vim.keymap.set("n", "Q", "<nop>", {
    desc = "Don't Use Q",
})

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", {
    desc = "Quickfix List: Next",
})

vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", {
    desc = "Quickfix List: Prev",
})

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {
    desc = "Location List: Next",
})

vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {
    desc = "Location List: Prev",
})

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", {
    silent = true,
    desc = "Chmod Ez",
})

vim.keymap.set("v", "<", "<gv", {
    desc = "Remove Indent Stay In Visual Mode",
})

vim.keymap.set("v", ">", ">gv", {
    desc = "Add Indent Stay In Visual Mode",
})

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", {
    desc = "New Tmux Session",
})

vim.keymap.set("n", "<leader>rp", "<cmd>!python3 %<CR>", {
    desc = "Run Python File",
})

-------------------------------------------------------------------------------
--        _             _
--  _ __ | |_   _  __ _(_)_ __  ___
-- | '_ \| | | | |/ _` | | '_ \/ __|
-- | |_) | | |_| | (_| | | | | \__ \
-- | .__/|_|\__,_|\__, |_|_| |_|___/
-- |_|            |___/
--
-- plugins: with lazy
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

    -- Colorscheme
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("onedark").setup({
                -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
                style = "deep",
                transparent = true,
                term_colors = true,
            })
            require("onedark").load()
        end,
    },

    -- Telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        init = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {
                desc = "Find Files",
            })
            vim.keymap.set("n", "<leader>pg", builtin.git_files, {
                desc = "Find Git Files",
            })
            vim.keymap.set("n", "<leader>ps", builtin.live_grep, {
                desc = "Grep For String",
            })
            vim.keymap.set("n", "<leader>pb", builtin.buffers, {
                desc = "Find Buffers",
            })
        end,
    },

    -- Treesitter: Advanced Syntax Highlighting/Parse Tree
    {
        "nvim-treesitter/nvim-treesitter",
        version = false,
        build = ":TSUpdate",
        event = { "BufReadPost", "BufNewFile" },
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "help",
                "python",
                "java",
                "cpp",
                "c",
                "lua",
                "go",
                "markdown",
                "json",
                "javascript",
                "html",
                "regex",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
        },
    },

    -- Harpoon: Per Project, File Navigation
    {
        "theprimeagen/harpoon",
        init = function()
            local mark = require("harpoon.mark")
            local ui = require("harpoon.ui")

            vim.keymap.set("n", "<leader>a", mark.add_file, {
                desc = "Harpoon: Add File",
            })
            vim.keymap.set("n", "<leader>ph", ui.toggle_quick_menu, {
                desc = "Harpoon: Toggle Menu",
            })
            vim.keymap.set("n", "<C-h>", function()
                ui.nav_file(1)
            end, {
                desc = "Harpoon: Open File 1",
            })
            vim.keymap.set("n", "<C-t>", function()
                ui.nav_file(2)
            end, {
                desc = "Harpoon: Open File 2",
            })
            vim.keymap.set("n", "<C-n>", function()
                ui.nav_file(3)
            end, {
                desc = "Harpoon: Open File 3",
            })
            vim.keymap.set("n", "<C-s>", function()
                ui.nav_file(4)
            end, {
                desc = "Harpoon: Open File 4",
            })
        end,
    },

    -- Undotree: File Tree History
    {
        "mbbill/undotree",
        init = function()
            vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, {
                desc = "Undotree: Toggle",
            })
        end,
    },

    -- LSP Zero: LSP Stuff
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v2.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            {
                "williamboman/mason.nvim",
                build = function()
                    pcall(vim.cmd, "MasonUpdate")
                end,
            },
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
        init = function()
            local lsp = require("lsp-zero")

            lsp.preset("recommended")

            lsp.ensure_installed({
                -- language servers
                "lua_ls",              -- lua
                "pyright",             -- python
                "clangd",              -- C/C++
                "jdtls",               -- Java
                "gopls",               -- Go
                "docker_compose_language_service", -- Docker Compose
                "dockerls",            -- Docker
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
                local opts = { buffer = bufnr, remap = false, desc = "" }

                if client.name == "eslint" then
                    vim.cmd.LspStop("eslint")
                    return
                end

                opts.desc = "LSP: Go To Definition"
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts, {})

                opts.desc = "LSP: Show Diagnostic"
                vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

                opts.desc = "LSP: Go To Implementation"
                vim.keymap.set("n", "gI", vim.lsp.buf.implementation, opts)

                opts.desc = "LSP: Show References"
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

                opts.desc = "LSP: Jump To Next Diagnostic"
                vim.keymap.set("n", "gj", vim.diagnostic.goto_next, opts)

                opts.desc = "LSP: Jump To Previous  Diagnostic"
                vim.keymap.set("n", "gk", vim.diagnostic.goto_prev, opts)

                opts.desc = "LSP: Get Signature Help"
                vim.keymap.set("n", "gh", vim.lsp.buf.signature_help, opts)

                opts.desc = "LSP: Show Documentation"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "LSP: Format File"
                vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, opts)

                opts.desc = "LSP: Rename"
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts)

                opts.desc = "LSP: Code Action"
                vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, opts)
            end)

            lsp.setup()

            vim.diagnostic.config({
                virtual_text = false,
                update_in_insert = true,
            })
        end,
    },

    -- Mason Tool Installer: Auto install DAP's, Linters, Formatters
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        init = function()
            local masontools = require("mason-tool-installer")

            local servers = {
                -- DAP Adapters
                -- Linters
                "flake8",
                -- Formatters
                "stylua",
                "black",
                "clang-format",
            }

            masontools.setup({
                ensure_installed = servers,
                auto_update = true,
                run_on_start = true,
            })
        end,
    },

    -- Nvim-Dap: DAP Wrapper For Neovim
    -- Note: nvim-dap doesn't actually require these, but these are useful
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            -- UI Support
            { "rcarriga/nvim-dap-ui" },
            { "theHamsta/nvim-dap-virtual-text" },

            -- Per Language Setup
            { "mfussenegger/nvim-dap-python" },
        },
        init = function()
            local dap = require("dap")

            vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", {
                desc = "DAP: Toggle Breakpoint",
            })
            vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", {
                desc = "DAP: Continue",
            })
            vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", {
                desc = "DAP: Step Into",
            })
            vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", {
                desc = "DAP: Step Over",
            })
            vim.keymap.set("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", {
                desc = "DAP: Step Out",
            })
            vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", {
                desc = "DAP: Toggle Repl",
            })
            vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", {
                desc = "DAP: Run Last",
            })
            vim.keymap.set("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", {
                desc = "DAP: Toggle UI",
            })
            vim.keymap.set("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", {
                desc = "DAP: Terminate",
            })

            -- Python
            local pdap = require("dap-python")
            pdap.test_runner = "pytest"
            pdap.setup("~/.local/share/nvim/mason/packages/debugpy/venv/bin/python3")

            -- thank u @chris@machine
            vim.fn.sign_define(
                "DapBreakpoint",
                { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
            )

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
        end,
    },

    -- Null-LS: Formatting and Linting
    {
        "jose-elias-alvarez/null-ls.nvim",
        init = function()
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
        end,
    },

    -- Autopairs: Auto place matching paren or brace
    {
        "windwp/nvim-autopairs",
        init = function()
            local autopairs = require("nvim-autopairs")
            autopairs.setup()
        end,
    },

    -- Comment: Easily comment and uncomment
    {
        "numToStr/Comment.nvim",
        init = function()
            local comment = require("Comment")

            comment.setup({
                ---Add a space b/w comment and the line
                padding = true,
                ---Whether the cursor should stay at its position
                sticky = true,
                ---Lines to be ignored while (un)comment
                ignore = nil,
                ---LHS of toggle mappings in NORMAL mode
                toggler = {
                    ---Line-comment toggle keymap
                    line = "gcc",
                    ---Block-comment toggle keymap
                    block = "gbc",
                },
                ---LHS of operator-pending mappings in NORMAL and VISUAL mode
                opleader = {
                    ---Line-comment keymap
                    line = "gc",
                    ---Block-comment keymap
                    block = "gb",
                },
                ---LHS of extra mappings
                extra = {
                    ---Add comment on the line above
                    above = "gcO",
                    ---Add comment on the line below
                    below = "gco",
                    ---Add comment at the end of line
                    eol = "gcA",
                },
                ---Enable keybindings
                ---NOTE: If given `false` then the plugin won't create any mappings
                mappings = {
                    ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
                    basic = true,
                    ---Extra mapping; `gco`, `gcO`, `gcA`
                    extra = true,
                },
            })
        end,
    },

    -- Lualine: Status line
    {
        "nvim-lualine/lualine.nvim",
        init = function()
            local lualine = require("lualine")

            local spaces = function()
                return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
            end

            local filename = {
                "filename",
                file_status = true, -- displays file status (readonly status, modified status)
                path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
            }

            lualine.setup({
                options = {
                    globalstatus = true,
                    icons_enabled = false,
                },
                sections = {
                    lualine_a = { "mode" },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { filename },
                    lualine_x = { "encoding", "fileformat", "filetype" },
                    lualine_y = { spaces },
                    lualine_z = { "location" },
                },
            })
        end,
    },

    -- GitSigns: Git sign integration in buffer
    {
        "lewis6991/gitsigns.nvim",
        init = function()
            local git = require("gitsigns")

            git.setup({
                signs = {
                    add = { text = "+" },
                    change = { text = "~" },
                    delete = { text = "_" },
                    topdelete = { text = "‾" },
                    changedelete = { text = "~" },
                },
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns
                    local opts = { buffer = bufnr, remap = false, desc = "" }

                    -- Navigation
                    vim.keymap.set("n", "]c", function()
                        if vim.wo.diff then
                            return "]c"
                        end
                        vim.schedule(function()
                            gs.next_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    vim.keymap.set("n", "[c", function()
                        if vim.wo.diff then
                            return "[c"
                        end
                        vim.schedule(function()
                            gs.prev_hunk()
                        end)
                        return "<Ignore>"
                    end, { expr = true })

                    -- Actions
                    opts.desc = "Git: Stage Hunk"
                    vim.keymap.set({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", opts)

                    opts.desc = "Git: Reset Hunk"
                    vim.keymap.set({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", opts)

                    opts.desc = "Git: Stage Buffer"
                    vim.keymap.set("n", "<leader>hS", gs.stage_buffer, opts)

                    opts.desc = "Git: Undo Stage Buffer"
                    vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, opts)

                    opts.desc = "Git: Reset Buffer"
                    vim.keymap.set("n", "<leader>hR", gs.reset_buffer, opts)

                    opts.desc = "Git: Preview Hunk"
                    vim.keymap.set("n", "<leader>hp", gs.preview_hunk, opts)

                    opts.desc = "Git: Show Git Blame"
                    vim.keymap.set("n", "<leader>hb", function()
                        gs.blame_line({ full = true })
                    end, opts)

                    opts.desc = "Git: Show Git Blame For Line"
                    vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, opts)

                    opts.desc = "Git: Diff"
                    vim.keymap.set("n", "<leader>hd", gs.diffthis, opts)

                    opts.desc = "Git: Diff This"
                    vim.keymap.set("n", "<leader>hD", function()
                        gs.diffthis("~")
                    end, opts)

                    opts.desc = "Git: Toggle Deleted"
                    vim.keymap.set("n", "<leader>td", gs.toggle_deleted, opts)
                end,
            })
        end,
    },

    -- Web Dev Icons: Good Icons (Mostly for dap ui)
    {
        "nvim-tree/nvim-web-devicons",
        init = function()
            require("nvim-web-devicons").setup()
        end,
    },

    -- nvim-tree: File Explorer
    {
        "nvim-tree/nvim-tree.lua",
        init = function()
            require("nvim-tree").setup()
        end,
    },

    -- Git integration
    {
        "tpope/vim-fugitive",
    },
})
