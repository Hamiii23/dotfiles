vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
})

local ensure_installed = {
	"bash",
	"c",
	"cpp",
	"css",
	"go",
	"html",
	"javascript",
	"json",
	"lua",
	"markdown",
	"python",
	"rust",
	"typescript",
	"tsx",
	"yaml",
}
require("nvim-treesitter").install(ensure_installed)

vim.api.nvim_create_autocmd("FileType", {
	callback = function(ev)
		if vim.bo[ev.buf].buftype ~= "" then
			return
		end

		local lang = vim.treesitter.language.get_lang(ev.match)
		if not lang then
			return
		end

		local ok = pcall(require, "nvim-treesitter.parsers")
		if ok and not require("nvim-treesitter.parsers")[lang] then
			return
		end

		if #vim.api.nvim_get_runtime_file("parser/" .. lang .. ".*", false) == 0 then
			require("nvim-treesitter").install({ lang })
		end

		pcall(vim.treesitter.start, ev.buf)
	end,
})
