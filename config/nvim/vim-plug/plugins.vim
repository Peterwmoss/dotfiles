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

" Latex live preview
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

" Autocomplete engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tabularize (align stuff)
Plug 'godlygeek/tabular'

" Quick maths
Plug 'ChristianChiarulli/codi.vim'

" Provides colors for hex codes
Plug 'ap/vim-css-color'

" Auto closing parentheses
Plug 'Raimondi/delimitMate'

" Easy comments
Plug 'tpope/vim-commentary'

" Enables di( out of parentheses
Plug 'wellle/targets.vim' 

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Provides closing tags for html
Plug 'alvan/vim-closetag'

" Color schemes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

"Async shit
Plug 'tpope/vim-dispatch'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
