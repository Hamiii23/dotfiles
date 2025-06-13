local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "moves lines down in visual selection" })
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "moves lines up in visual selection" })

keymap("n", "<A-j>", ":m .+1<CR>==", { desc = "Move current line down" })
keymap("n", "<A-k>", ":m .-2<CR>==", { desc = "Move current line up" })

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("v", "p", '"_dp', opts)

keymap("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })
keymap("n", "<leader>f", vim.lsp.buf.format)

keymap("n", "x", '"_x', opts)

-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

--split management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
-- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
-- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- close current split window
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })
