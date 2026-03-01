vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Line moving
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })

-- Indent and stay in visual
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Search
map("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear search highlight" })

-- Unmap Q
map("n", "Q", "<nop>")

-- Chmod
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Tmux
map("n", "<A-f>", function()
	vim.fn.system("tmux display-popup -E -w 80% -h 60% tmux-sessionizer")
end)
map("n", "<A-o>", function()
	vim.fn.system("tmux display-popup -E -w 80% -h 60% tmux-windowizer")
end)
map("n", "<A-s>", function()
	vim.fn.system("tmux display-popup -E -w 80% -h 60% session-switcher")
end)

-- Splits
map("n", "<leader>|", "<C-w>v", { desc = "Split vertically" })
map("n", "<leader>-", "<C-w>s", { desc = "Split horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Equal split size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })
map("n", "<leader>sm", "<C-w>|<C-w>_", { desc = "Maximize split" })

-- Diagnostics
local diag_visible = true
map("n", "<leader>lx", function()
	diag_visible = not diag_visible
	vim.diagnostic.enable(diag_visible)
end, { desc = "Toggle diagnostics" })

map("n", "<leader>qf", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
map("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

map("n", "[d", function()
	vim.diagnostic.jump({ count = -1, float = true })
end, { desc = "Previous diagnostic" })
map("n", "]d", function()
	vim.diagnostic.jump({ count = 1, float = true })
end, { desc = "Next diagnostic" })

-- Quickfix
vim.api.nvim_create_autocmd("FileType", {
	pattern = "qf",
	callback = function()
		map("n", "q", "<cmd>close<CR>", { buffer = true })
		map("n", "<CR>", "<CR><cmd>wincmd p<CR>", { buffer = true })
	end,
})

-- Package management
map("n", "<leader>pu", function()
	vim.pack.update()
end, { desc = "Update plugins" })
