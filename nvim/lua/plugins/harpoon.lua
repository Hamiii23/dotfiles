vim.pack.add({
	{
		src = "https://github.com/ThePrimeagen/harpoon",
		version = "harpoon2",
	},
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
})

local harpoon = require("harpoon")

harpoon:setup({
	global_settings = {
		save_on_toggle = true,
		save_on_change = true,
	},
})

local map = vim.keymap.set

map("n", "<leader>a", function()
	harpoon:list():add()
end)

map("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

map("n", "<A-q>", function()
	harpoon:list():select(1)
end)

map("n", "<A-w>", function()
	harpoon:list():select(2)
end)

map("n", "<A-e>", function()
	harpoon:list():select(3)
end)

map("n", "<A-r>", function()
	harpoon:list():select(4)
end)

map("n", "H", function()
	harpoon:list():prev()
end)

map("n", "L", function()
	harpoon:list():next()
end)
map("n", "<leader>hc", function()
	harpoon:list():clear()
end, { desc = "Clear all Harpoon marks" })
