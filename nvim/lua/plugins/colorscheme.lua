return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        opts = {
            color_overrides = {
                mocha = {
                    base = "#000000",
                    mantle = "#000000",
                    crust = "#000000",
                },
            },
        },
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        lazy = false,
        priority = 1000,
        opts = {
            dark_variant = "main",
            highlight_groups = {
                Normal       = { bg = "#000000" },
                NormalNC     = { bg = "#000000" },
                NormalFloat  = { bg = "#000000" },
                FloatBorder  = { bg = "#000000" },
                Pmenu        = { bg = "#000000" },
                PmenuSel     = { bg = "#1a1a1a" },
                TelescopeNormal = { bg = "#000000" },
                TelescopeBorder = { bg = "#000000" },
                StatusLine   = { bg = "#000000" },
                SignColumn   = { bg = "#000000" },
                VertSplit    = { bg = "#000000" },
            },
        },
    }

}
