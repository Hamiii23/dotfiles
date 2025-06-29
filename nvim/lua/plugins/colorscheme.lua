return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    -- priority = 1000,
    opts = {
    },
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",
        dim_inactive_windows = false,
        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
        -- palette = {
        --   base = "#000000",
        --   surface = "#000000",
        --   overlay = "#111111",
        -- },
        -- highlight_groups = {
        --   Normal = { bg = "#000000" },
        --   NormalFloat = { bg = "#000000" },
        --   NormalNC = { bg = "#000000" },
        --   CursorLine = { bg = "#111111" },
        --   CursorColumn = { bg = "#111111" },
        --   ColorColumn = { bg = "#111111" },
        --   SignColumn = { bg = "#000000" },
        --   StatusLine = { bg = "#000000" },
        --   StatusLineNC = { bg = "#000000" },
        --   TabLine = { bg = "#000000" },
        --   TabLineFill = { bg = "#000000" },
        --   VertSplit = { bg = "#000000" },
        --   WinSeparator = { bg = "#000000" },
        -- },
      })
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
