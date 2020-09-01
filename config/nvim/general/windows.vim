" Close the current buffer
"map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
"map <leader>ba :bufdo bd<cr>

" Buffers
map <leader>bn :bnext<cr>
map <leader>bp :bprevious<cr>
map <leader>bl :ls<cr>
map <leader>bq :Bonly<cr>
map <leader>bd :bd<cr>

" Managing tabs
nmap <leader>tn :tabnew
nmap <leader>tc :tabclose<cr>
nmap <leader>tm :tabmove 
nmap <tab> :tabnext<cr>
nmap <S-tab> :tabprevious<cr>

" Window switching
nmap <leader>k <C-w>k
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>l <C-w>l

" Handy resizing
nnoremap <silent> <leader>rh+ :res +5<CR>
nnoremap <silent> <leader>rh- :res -5<CR>

nnoremap <silent> <leader>rv+ :vertical resize +10<CR>
nnoremap <silent> <leader>rv- :vertical resize -10<CR>

" Splitting
nnoremap <silent> <leader>bhs :split<CR>
nnoremap <silent> <leader>bvs :vsplit<CR>
