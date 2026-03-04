vim.pack.add({
	{ src = "https://github.com/sschleemilch/slimline.nvim" },
	{ src = "https://github.com/navarasu/onedark.nvim" },
})

require("onedark").setup({
	style = "deep",
	transparent = true,
	term_colors = true,
	ending_tildes = false,
	cmp_itemkind_reverse = false,

	code_style = {
		comments = "italic",
		keywords = "none",
		functions = "none",
		strings = "none",
		variables = "none",
	},

	diagnostics = {
		darker = false,
		undercurl = true,
		background = false,
	},
	highlights = {
		StatusLine = { bg = "NONE" },
		StatusLineNC = { bg = "NONE" },
	},
})

vim.cmd("colorscheme onedark")
vim.api.nvim_set_hl(0, "BlinkCmpDoc", { bg = "#000000" })
vim.api.nvim_set_hl(0, "BlinkCmpDocBorder", { bg = "#000000" })
vim.api.nvim_set_hl(0, "BlinkCmpDocSeparator", { bg = "#000000" })
vim.api.nvim_set_hl(0, "BlinkCmpMenu", { bg = "#000000" })
vim.api.nvim_set_hl(0, "BlinkCmpMenuBorder", { bg = "#000000" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#000000" })

require("slimline").setup({
	style = "fg",
	components = {
		left = { "mode", "path" },
		center = {},
	},
})
