vim.keymap.set("n", "gf", function()
    if require("obsidian").util.cursor_on_markdown_link() then
        return "<cmd>ObsidianFollowLink<CR>"
    else
        return "gf"
    end
end, { noremap = false, expr = true, desc = "Obsidian: Follow Link" })

return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand':
    -- event = { "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md" },
    event = { "BufReadPre " .. vim.fn.expand("~") .. "/Notes/**.md" },
    cmd = {
        "ObsidianOpen",
        "ObsidianNew",
        "ObsidianQuickSwitch",
        "ObsidianFollowLink",
        "ObsidianBacklinks",
        "ObsidianToday",
        "ObsidianYesterday",
        "ObsidianTemplate",
        "ObsidianSearch",
        "ObsidianLink",
        "ObsidianLinkNew",
    },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",
    },
    opts = {
        dir = "~/Notes", -- no need to call 'vim.fn.expand' here
        notes_subdir = "Notes",
        -- Disable by default gf passthrough - it complains
        -- Instead bind with keybinding
        mappings = {},
    },
    keys = {
        { "<leader>os", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian: Search Files" },
        { "<leader>on", "<cmd>ObsidianNew<CR>", desc = "Obsidian: New File" },
    },
}
