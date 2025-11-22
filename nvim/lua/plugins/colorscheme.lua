vim.pack.add({
	{ src = "https://github.com/vague2k/vague.nvim" },
	-- { src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/sschleemilch/slimline.nvim" },
})

require("vague").setup({
	colors = {
		bg = "#000000",
	},
})

-- require("rose-pine").setup({
-- 	variant = "main",
-- 	dark_variant = "main",
-- 	dim_inactive_windows = false,
-- 	styles = {
-- 		bold = true,
-- 		italic = true,
-- 		transparency = true,
-- 	},
-- })

vim.cmd("colorscheme vague")

require("slimline").setup({
	style = "fg",
})
