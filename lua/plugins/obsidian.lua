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
        dir = "~/ObsidianNotes", -- no need to call 'vim.fn.expand' here
        notes_subdir = "Notes",
        -- Disable by default gf passthrough - it complains
        -- Instead bind with keybinding
        mappings = {},
        -- By default an id is appended - just make it the title passed
        note_id_func = function(title)
            return title
        end,
    },
    keys = {
        { "<leader>oo", "<cmd>ObsidianOpen<CR>", desc = "Obsidian: Open In Obsidian" },
        { "<leader>of", "<cmd>ObsidianQuickSwitch<CR>", desc = "Obsidian: Search Files" },
        { "<leader>os", "<cmd>ObsidianSearch<CR> ", desc = "Obsidian: Grep" },
        { "<leader>ob", "<cmd>ObsidianBacklinks<CR> ", desc = "Obsidian: Open Backlinks" },
    },
}
