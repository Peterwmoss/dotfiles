set number
syntax on

call plug#begin('~/.vim/plugged')

Plug 'Rigellute/shades-of-purple.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'OmniSharp/omnisharp-vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'valloric/youcompleteme'
Plug 'leafgarland/typescript-vim'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'severin-lemaignan/vim-minimap'

call plug#end()

if (has("termguicolors"))
 set termguicolors
endif

" let g:shades_of_purple_airline = 1
" let g:airline_theme='shades_of_purple'
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"

nmap <C-n> <esc>:NERDTreeToggle<cr>
nmap <C-m> <esc>:MinimapToggle<cr>

"colorscheme shades_of_purple
colorscheme corvine

hi Normal guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE
