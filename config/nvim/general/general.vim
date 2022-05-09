" Set history to 500
set history=500

" 8 lines after cursor still shown
set so=8

" Buffers
set hidden

" Turn on wild menu
set wildmenu

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets when on one
set showmatch

" Indents
set expandtab
set smarttab
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set autoindent
set wrap linebreak

" Search
set ignorecase
set nohlsearch

set completeopt=menuone,noinsert,noselect

" General
set encoding=utf-8
set mouse=
set number relativenumber
set spelllang=da,en_us
set cursorline
set signcolumn=yes
set cmdheight=1

set nobackup
set nowritebackup

set updatetime=50

" Clipboard
set clipboard=unnamedplus

" Fix splitting
set splitbelow splitright

set conceallevel=0

" Statusline
set noshowmode

set viewoptions="folds,options,cursor"

au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=100}
