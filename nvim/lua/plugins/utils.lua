vim.pack.add({
	{ src = "https://github.com/mbbill/undotree" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/nvim-mini/mini.hipatterns" },
})

require("nvim-autopairs").setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
})

local gs = require("gitsigns")
vim.keymap.set("n", "]c", gs.next_hunk, { desc = "Next hunk" })
vim.keymap.set("n", "[c", gs.prev_hunk, { desc = "Prev hunk" })

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
