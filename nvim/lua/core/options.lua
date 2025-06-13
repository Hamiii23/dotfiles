vim.cmd("let g:netrw_banner = 0 ")

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

opt.incsearch = true
opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true

opt.termguicolors = true
opt.background = "dark"

opt.scrolloff = 8
opt.signcolumn = "yes"

-- backspace
opt.backspace = { "start", "eol", "indent" }

--split windows
opt.splitright = true --split vertical window to the right
opt.splitbelow = true --split horizontal window to the bottom

opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"

-- clipboard
opt.clipboard:append("unnamedplus") --use system clipboard as default
opt.fillchars:append({ eob = " " })
opt.hlsearch = true

-- for easy mouse resizing, just incase
opt.mouse = "a"

-- gets rid of line with white spaces
vim.g.editorconfig = true
