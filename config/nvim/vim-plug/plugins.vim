" Enable filetype plugins
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')

" More syntax highlighting
Plug 'vim-syntastic/syntastic'
Plug 'sheerun/vim-polyglot'

" Surround stuff
Plug 'tpope/vim-surround'

" Git
Plug 'tpope/vim-fugitive'

" Autocomplete engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tabularize (align stuff)
Plug 'godlygeek/tabular'

" Provides colors for hex codes
Plug 'ap/vim-css-color'

" Auto closing parentheses
"Plug 'Raimondi/delimitMate'
Plug 'jiangmiao/auto-pairs'

" Easy comments
Plug 'tpope/vim-commentary'

" Enables di( out of parentheses
Plug 'wellle/targets.vim' 

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Color schemes
"Plug 'morhetz/gruvbox'
"Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'gruvbox-community/gruvbox'

"Async shit
Plug 'tpope/vim-dispatch'

Plug 'mhinz/vim-startify'

Plug 'alvan/vim-closetag'

call plug#end()
