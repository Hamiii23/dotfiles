vim.pack.add({
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/NvChad/nvim-colorizer.lua" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
})

require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
})

require("gitsigns").setup({})

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

require("colorizer").setup({
	user_default_options = {
		tailwind = true,
	},
	filetypes = { "html", "css", "javascript", "typescript", "jsx", "tsx", "vue", "svelte" },
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		vim.cmd("ColorizerAttachToBuffer")
	end,
})
