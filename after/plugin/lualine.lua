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
