" Set leader key
let mapleader = " "

" Fast saving
nmap <leader>w :w<CR>

" Search
nnoremap <F5> :set nohlsearch!<cr>

" Next find
nnoremap , ;
nnoremap ; ,
vnoremap , ;
vnoremap ; ,

map æ (
map ø )
map å ^

" Indenting
vnoremap < <gv
vnoremap > >gv
vnoremap <s-tab> >gv
vnoremap <tab> <gv

nnoremap Y y$

nnoremap cw ciw

nnoremap ' `

nnoremap yA m'ggyG`'zz

" Toggle
nmap <leader>ts :set spell!<cr>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $

" Indenting
vmap <tab> >gv
vmap <S-tab> <gv

" Moving lines
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" Buffers
nmap <tab> :tabnext<cr>
nmap <S-tab> :tabprevious<cr>
map <leader>b :buffers<cr>:buffer<space>
map <leader>B :buffers<cr>
map <leader>d :tabclose<cr>

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

" Comments
nmap <leader>/ :Commentary<CR>
vmap / :Commentary<CR>gv

" Splitting
nnoremap <silent> <leader>h :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>

" Terminal escape to get to normal mode
tnoremap <Esc> <C-\><C-n>:q<CR>

nmap <leader>cf 0f{zf%

" Toggles
nnoremap <leader>th :set nohlsearch!<cr>

" Open new file
nmap <leader>e :e 

" Remap " to '
nnoremap ' "
vnoremap ' "

" Toggle between vim clipboard and X clipboard
function! ToggleClipboard()
    if &clipboard ==# ""
        set clipboard=unnamedplus
    else
        set clipboard=""
    endif
endfunction

nmap <leader>tc :call ToggleClipboard()<cr>
