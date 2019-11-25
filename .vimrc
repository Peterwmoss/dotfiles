" Syntax highlighting
syntax on 

" Indents
set tabstop=4
set softtabstop=4
set noexpandtab
set smartindent
set shiftwidth=4

" Search
set ignorecase

" General
set encoding=utf-8
"set visualbell
set mouse=a
set nocompatible
set rtp+=~/.vim/bundle/Vundle.vim
set relativenumber

filetype off

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'leafgarland/typescript-vim'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'joshdick/onedark.vim'
Plugin 'frazrepo/vim-rainbow'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'arcticicestudio/nord-vim'
Plugin 'jaxbot/semantic-highlight.vim'

call vundle#end()
filetype plugin indent on

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

if (has("termguicolors"))
	set termguicolors
endif

" Airline theme
let g:shades_of_purple_airline = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'

" Indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_enable_on_vim_startup = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#111111   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#222222 ctermbg=4

" Ensure ycm on java
let g:syntastic_java_checkers = []

" Load rainbow parentheses automatically
au VimEnter * RainbowLoad

" Map toggles
nmap <C-b> <esc>:NERDTreeToggle<cr>
nmap <C-m> <esc>:MinimapToggle<cr>
nmap <C-s> <esc>:SemanticHighlightToggle<cr>

" Map tab switching
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

colorscheme candid

" Turn off background
hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE
