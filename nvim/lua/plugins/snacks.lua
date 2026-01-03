vim.pack.add({
	{ src = "https://github.com/folke/snacks.nvim" },
})

local snacks = require("snacks")

snacks.setup({
	styles = {
		input = {
			keys = {
				n_esc = { "<C-c>", { "cmp_close", "cancel" }, mode = "n", expr = true },
				i_esc = { "<C-c>", { "cmp_close", "stopinsert" }, mode = "i", expr = true },
			},
		},
	},
	picker = {
		enabled = true,
		matchers = {
			frecency = true,
			cwd_bonus = false,
		},
		formatters = {
			file = {
				filename_first = false,
				filename_only = false,
				icon_width = 2,
			},
		},
		layout = {
			preset = "telescope",
			cycle = false,
		},
	},
})

local map = vim.keymap.set

map("n", "<leader>lg", function()
	snacks.lazygit()
end, { desc = "Lazygit" })

map("n", "<leader>gl", function()
	snacks.lazygit.log()
end, { desc = "Lazygit Logs" })

map("n", "<leader>gb", function()
	snacks.picker.git_branches({ layout = "select" })
end, { desc = "Pick and Switch Git Branches" })

map("n", "<leader>rN", function()
	snacks.rename.rename_file()
end, { desc = "Fast Rename Current File" })

map("n", "<leader>bd", function()
	snacks.bufdelete()
end, { desc = "Delete or Close Buffer  (Confirm)" })

map("n", "<leader>ff", function()
	snacks.picker.files()
end, { desc = "Find Files (Snacks Picker)" })

map("n", "<leader>fc", function()
	snacks.picker.files({ cwd = vim.fn.stdpath("config") })
end, { desc = "Find Config File" })

map("n", "<leader>fg", function()
	snacks.picker.grep()
end, { desc = "Grep word" })

map({ "n", "x" }, "<leader>fw", function()
	snacks.picker.grep_word()
end, { desc = "Search Visual selection or Word" })

map("n", "<leader>fk", function()
	snacks.picker.keymaps({ layout = "ivy" })
end, { desc = "Search Keymaps (Snacks Picker)" })

map("n", "<leader>fh", function()
	snacks.picker.help()
end, { desc = "Help Pages" })
