" Set leader key
let mapleader = " "

" Fast saving
nmap <leader>w :w!<CR>
nmap <leader>W :wa!<CR>

" Easy quit
nmap <leader>q :q<CR>
nmap <leader>Q :qa<CR>

" Search
nnoremap <F5> :set nohlsearch!<cr>
nnoremap <leader>S :%s//gI<Left><Left><Left>

" Next find
nnoremap , ;
nnoremap ; ,

map æ *
map ø £
map å ^

" Toggles 
nmap <leader>ts :set spell!<cr>
nnoremap <leader>th :set nohlsearch!<cr>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $

" Shell commands
map <leader>,l :silent !pdflatex main.tex *.tex<cr>
map <leader>,L :!pdflatex main.tex *.tex<cr>

" Indenting
vmap <tab> >gv
vmap <S-tab> <gv

" Moving lines
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" Buffers
nmap <tab> :bnext<cr>
nmap <S-tab> :bprevious<cr>
map <leader>bo :Bonly<cr>
map <leader>bd :bd<cr>
map <C-q> :bd<cr>

" Window switching
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

" Handy resizing
nnoremap <silent> <leader>rh+ :res +5<CR>
nnoremap <silent> <leader>rh- :res -5<CR>

nnoremap <silent> <leader>rv+ :vertical resize +10<CR>
nnoremap <silent> <leader>rv- :vertical resize -10<CR>

" Splitting
nnoremap <silent> <leader>h :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>

" Background
nmap <leader>x :set background=light<cr>
nmap <leader>X :set background=dark<cr>
