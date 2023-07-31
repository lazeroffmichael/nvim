return {
    -- Modify which-key keys
    {
        "folke/which-key.nvim",
        opts = function()
            require("which-key").register({
                ["<leader>o"] = {
                    name = "+Obsidian",
                },
                ["<leader>m"] = {
                    name = "+MarkdownPreview",
                },
                ["<leader>r"] = {
                    name = "+Run",
                },
            })
        end,
    },
}
