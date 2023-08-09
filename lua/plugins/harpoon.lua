return {
  {
    {
      "theprimeagen/harpoon",
      config = function()
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        vim.keymap.set("n", "<leader>a", mark.add_file, {
          desc = "Harpoon: Add File",
        })
        vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, {
          desc = "Harpoon: Toggle Menu",
        })
        vim.keymap.set("n", "<leader>ha", function()
          ui.nav_file(1)
        end, {
          desc = "Harpoon: Open File 1",
        })
        vim.keymap.set("n", "<leader>hs", function()
          ui.nav_file(2)
        end, {
          desc = "Harpoon: Open File 2",
        })
        vim.keymap.set("n", "<leader>hd", function()
          ui.nav_file(3)
        end, {
          desc = "Harpoon: Open File 3",
        })
        vim.keymap.set("n", "<leader>hf", function()
          ui.nav_file(4)
        end, {
          desc = "Harpoon: Open File 4",
        })
      end,
    },
  },
}
