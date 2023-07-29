return {
    {
        "rose-pine/neovim",
        name = "rose-pine",
        opts = {
            --- @usage 'main'|'moon'|'dawn'|'auto'
            variant = "moon",
            dim_nc_background = true,
            disable_background = false,
        },
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "rose-pine",
        },
    },
}
