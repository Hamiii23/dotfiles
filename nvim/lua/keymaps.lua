local opts = { noremap = true, silent = true }
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("x", "<leader>p", [["_dP]])
map("v", "p", '"_dp', opts)
map("n", "<leader>Y", [["+Y]], opts)

map({ "n", "v" }, "<leader>d", [["_d]])

map("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
map("n", "<leader>f", vim.lsp.buf.format)

-- Unmaps Q in normal mode
map("n", "Q", "<nop>")

map("n", "x", '"_x', opts)

map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "makes file executable" })

map("n", "<leader>to", "<cmd>tabnew<CR>") --open new tab
map("n", "<leader>tx", "<cmd>tabclose<CR>") --close current tab
map("n", "<leader>tn", "<cmd>tabn<CR>") --go to next
map("n", "<leader>tp", "<cmd>tabp<CR>") --go to pre
map("n", "<leader>tf", "<cmd>tabnew %<CR>") --open current tab in new tab

map("n", "<leader>|", "<C-w>v", { desc = "Split window vertically" })
map("n", "<leader>-", "<C-w>s", { desc = "Split window horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

map("n", "<leader>fp", function()
	local filePath = vim.fn.expand("%:~")
	vim.fn.setreg("+", filePath)
	print("File path copied to clipboard: " .. filePath)
end, { desc = "Copy file path to clipboard" })

local isLspDiagnosticsVisible = true
map("n", "<leader>lx", function()
	isLspDiagnosticsVisible = not isLspDiagnosticsVisible
	vim.diagnostic.config({
		virtual_text = isLspDiagnosticsVisible,
		underline = isLspDiagnosticsVisible,
	})
end, { desc = "Toggle LSP diagnostics" })
