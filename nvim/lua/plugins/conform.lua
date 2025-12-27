vim.pack.add({
	{ src = "https://github.com/stevearc/conform.nvim" },
})
require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		typescript = { "prettier" },
		javascript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		cpp = { "clang-format" },
		go = { "goimports" },
		rust = { "rustfmt" },
		sh = { "shfmt" },
		bash = { "shfmt" },
		prisma = { "prismaFmt" },
		html = { "prettier" },
		css = { "prettier" },
		python = { "ruff_format", "ruff_organize_imports" },
	},
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 1000,
	},
})
