vim.pack.add({
	{ src = "https://github.com/NvChad/nvim-colorizer.lua" },
})

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
