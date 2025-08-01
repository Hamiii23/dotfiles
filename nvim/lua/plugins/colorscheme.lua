return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		-- priority = 1000,
		opts = {},
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
			})
		end,
	},
}
