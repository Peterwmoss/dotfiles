" Vim fugitive binds
nmap <leader>gg :G<cr>
nmap <leader>gl :diffget //3<cr>
nmap <leader>gh :diffget //2<cr>
nmap <leader>gc :G commit<cr>
nmap <leader>gp :G push<cr>
nmap <leader>gd :Gsplit<cr>

" Git stage and commit all
nmap <leader>gsc :G<cr>/Unstaged<cr>s:G commit<cr>
