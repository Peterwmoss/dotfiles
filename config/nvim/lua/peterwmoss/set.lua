local CACHE_DIR = vim.fn.stdpath "cache"

local opt = vim.opt
local cmd = vim.cmd

opt.clipboard = "unnamedplus"

opt.mouse = ""

opt.number = true
opt.relativenumber = true
opt.numberwidth = 4

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false
opt.linebreak = true

opt.swapfile = false
opt.writebackup = false
opt.backup = false
opt.undodir = CACHE_DIR .. "/undo"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true

opt.termguicolors = true

opt.scrolloff = 12

opt.signcolumn = "yes"

opt.isfname:append("@-@")

opt.updatetime = 50

opt.conceallevel = 0

opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.cmdheight = 1

opt.hidden = true

opt.spelllang = { "da", "en_us" }
opt.background = "dark"
opt.colorcolumn = "100"

opt.timeoutlen = 500

opt.cursorline = true

opt.showmode = false

opt.viewoptions = { "folds", "cursor" }
opt.spell = false

cmd([[let g:netrw_bufsettings="noma nomod nonu nobl nowrap ro rnu"]])
