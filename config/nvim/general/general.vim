" Set history to 500
set history=500

" Set auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" 10 lines after cursor still shown
set so=10

" Turn on wild menu
set wildmenu

" Don't redraw while executing macros
set lazyredraw

" Show matching brackets when on one
set showmatch

" Indents
set expandtab
set smarttab
set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set si
set ai
set wrap
au FileType cpp,c setlocal shiftwidth=2 softtabstop=2 expandtab

" Search
set ignorecase
set nohlsearch

" Find files everywhere
"autocmd VimEnter * setlocal path+=**
autocmd VimEnter *.js,*.ts,*.tsx,*.jsx setlocal path+=src/**
autocmd VimEnter *.fs,*.fsx setlocal filetype=fsharp

" General
set encoding=utf-8
"set mouse=
set nocompatible
set relativenumber
set number relativenumber
set spelllang=en_us,da
set cursorline

" Clipboard
set clipboard=unnamedplus

" Autocompletion
"set wildmode=longest,list,full

" Fix splitting
set splitbelow splitright

set timeoutlen=500

set conceallevel=0
