local CACHE_DIR = vim.fn.stdpath "cache"

vim.opt.clipboard = "unnamedplus"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.undodir = CACHE_DIR .. "/undo"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8

vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.conceallevel = 0

vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.cmdheight = 1

vim.opt.hidden = true

vim.opt.spelllang = { "da", "en_us" }
vim.opt.background = "dark"
vim.opt.colorcolumn = "100"

vim.opt.timeoutlen = 500

vim.opt.cursorline = true

vim.opt.fileencoding = "utf-8"
vim.opt.viewoptions = { "folds", "cursor" }
vim.opt.spell = false
