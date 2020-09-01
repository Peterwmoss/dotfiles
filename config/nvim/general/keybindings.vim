" Set leader key
let mapleader = " "

" Fast saving
nmap <leader>w :w!<CR>

" Easy quit
nmap <leader>qa :qa<CR>
nmap <leader>qw :q<CR>

" fuck escape
"inoremap jk <esc>
"inoremap kj <esc>
"inoremap jj <esc>

" Easy CAPS
"inoremap <c-u> <esc>viwUi
"nnoremap <s-u> viwU<esc>

" Search
nnoremap <F5> :set nohlsearch!<cr>
nnoremap S :%s//gI<Left><Left><Left>

" Next find
nnoremap , ;
nnoremap ; ,

map æ *
map ø £
map å ^

" Toggle spell check
nmap <leader>st :set spell!<cr>

" Map ½ to something useful
map ½ $
cmap ½ $
imap ½ $

" Shell commands
map <leader>ct :!touch<space>
map <leader>cm :!mv<space>
map <leader>cc :!cp<space>
map <leader>cr :!rm<space>
map <leader>cd :!mkdir -p<space>
map <leader>cl :!pdflatex main.tex *.tex<cr>

" Indenting
vmap > >gv
vmap < <gv
vmap <tab> >gv
vmap <S-tab> <gv

" Moving lines
nnoremap <down> :m .+1<CR>==
nnoremap <up> :m .-2<CR>==
vnoremap <down> :m '>+1<CR>gv=gv
vnoremap <up> :m '<-2<CR>gv=gv

" Zeal docs
:nnoremap <leader>cz :!zeal "<cword>"&<CR><CR>

" Markdown
noremap <silent> <leader>m :call OpenMarkdownPreview()<cr>

function! OpenMarkdownPreview() abort
  if exists('s:markdown_job_id') && s:markdown_job_id > 0
    call jobstop(s:markdown_job_id)
    unlet s:markdown_job_id
  endif
  let s:markdown_job_id = jobstart('python -m grip ' . shellescape(expand('%:p')))
  if s:markdown_job_id <= 0 | return | endif
  call system('open http://localhost:6419')
endfunction
