vim.cmd("let g:netrw_banner = 0 ")

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.incsearch = true
opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"

opt.scrolloff = 8
opt.signcolumn = "yes"


opt.backspace = { "start", "eol", "indent" }

opt.splitright = true
opt.splitbelow = true

opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"

-- clipboard
opt.clipboard:append("unnamedplus")
opt.hlsearch = true
opt.mouse = "a"

vim.g.editorconfig = true
