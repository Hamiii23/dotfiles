vim.pack.add({
	-- { src = "https://github.com/vague2k/vague.nvim" },
	{ src = "https://github.com/rose-pine/neovim" },
	{ src = "https://github.com/sschleemilch/slimline.nvim" },
})

-- require("vague").setup({
-- 	colors = {
-- 		bg = "#000000",
-- 	},
-- })

require("rose-pine").setup({
	variant = "main",
	dark_variant = "main",
	dim_inactive_windows = false,
	styles = {
		bold = true,
		italic = true,
		transparency = true,
	},
	highlight_groups = {
		BlinkCmpDoc = { bg = "none" },
		BlinkCmpDocBorder = { bg = "none" },
		BlinkCmpDocSeparator = { bg = "none" },
	},
})

vim.cmd("colorscheme rose-pine")
vim.api.nvim_set_hl(0, "LspInlayHint", { bg = "NONE", fg = vim.api.nvim_get_hl(0, { name = "LspInlayHint" }).fg })

require("slimline").setup({
	style = "fg",
	components = {
		left = { "mode", "path" },
		center = {},
	},
})
