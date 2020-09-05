" Enable filetype plugins
filetype plugin on
filetype indent on

call plug#begin('~/.vim/plugged')

Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'ayu-theme/ayu-vim'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ianks/vim-tsx'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ChristianChiarulli/codi.vim'
Plug 'ap/vim-css-color'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key'
Plug 'wellle/targets.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
Plug 'alvan/vim-closetag'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'mellowcandle/vim-bitwise'
Plug 'tpope/vim-commentary'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
