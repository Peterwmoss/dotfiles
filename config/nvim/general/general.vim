" Set history to 500
set history=500

" Set auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter,FocusLost * checktime

" 15 lines after cursor still shown
set so=20

" Buffers
set hid

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
set autoindent
set wrap
au FileType cpp,c setlocal shiftwidth=2 softtabstop=2 expandtab
au FileType Makefile setlocal noexpandtab

" Search
set ignorecase
set nohlsearch

" Filetypes
au VimEnter,BufRead,BufNewFile *.fs,*.fsx,*.fsl,*.fsy setlocal filetype=fsharp
au BufRead,BufNewFile *.tex set filetype=tex

" General
set encoding=utf-8
set mouse=
set nocompatible
set number relativenumber
set spelllang=en_us,da
set cursorline

" Clipboard
set clipboard=unnamedplus

" Fix splitting
set splitbelow splitright

set timeoutlen=1000

set conceallevel=0

au BufWinLeave *.* mkview!
au BufWinEnter *.* silent! loadview

" Statusline
set noshowmode

function! GitBranch()
  return system("git branch --show-current 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0 ? '  '.l:branchname : ''
endfunction

function! GetMode()
    let l:mode = mode()

    if l:mode ==# "n"
        return "normal"
    elseif l:mode ==# "i"
        return "insert"
    elseif l:mode ==# "v"
        return "visual"
    elseif l:mode ==# "V"
        return "visual [line]"
    elseif l:mode ==# "CTRL-V"
        return "visual [block]"
    elseif l:mode ==# "R"
        return "replace"
    elseif l:mode ==# "c"
        return "command"
    else
        return l:mode
    endif
endfunction

set statusline=
set statusline+=%#Number#
set statusline+=\ %{GetMode()}
set statusline+=%#Keyword#
set statusline+=%{StatuslineGit()}
set statusline+=%#Type#
set statusline+=\ %f
set statusline+=\ %m
set statusline+=\ %r
set statusline+=%=
set statusline+=%#Todo#
set statusline+=\ %{coc#status()}
set statusline+=%#Comment#
set statusline+=\ %y
set statusline+=\ %l/%L
set statusline+=\ %p%%
