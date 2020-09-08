" Set history to 500
set history=500

" Set auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" 15 lines after cursor still shown
set so=15

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

" Include src in path for js projects
au VimEnter *.js,*.ts,*.tsx,*.jsx setlocal path+=src/**

" Filetypes
command! CompileLatex :silent !pdflatex main.tex *.tex
au VimEnter *.fs,*.fsx,*.fsl setlocal filetype=fsharp
au BufRead,BufNewFile *.tex set filetype=tex

" General
set encoding=utf-8
set nocompatible
set relativenumber
set number relativenumber
set spelllang=en_us,da
set cursorline

" Clipboard
set clipboard=unnamedplus

" Fix splitting
set splitbelow splitright

set timeoutlen=500

set conceallevel=0
