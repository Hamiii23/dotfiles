return {
	-- {
	-- 	"rose-pine/neovim",
	-- 	name = "rose-pine",
	-- 	-- priority = 1000,
	-- 	opts = {},
	-- 	config = function()
	-- 		require("rose-pine").setup({
	-- 			variant = "main",
	-- 			dark_variant = "main",
	-- 			dim_inactive_windows = false,
	-- 			styles = {
	-- 				bold = true,
	-- 				italic = false,
	-- 				transparency = true,
	-- 			},
	-- 		})
	-- 		vim.cmd("colorscheme rose-pine")
	-- 	end,
	-- },
	{
		"vague2k/vague.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("vague").setup({
				colors = {
					bg = "#000000",
				},
			})
			vim.cmd("colorscheme vague")
		end,
	},
}
