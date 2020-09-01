syntax on 

" Colors
set termguicolors
"let ayucolor="mirage"   " for dark version of theme
"colorscheme ayu
"nmap <leader>x :let ayucolor="light"<cr>:colorscheme ayu<cr>
"nmap <leader>X :let ayucolor="mirage"<cr>:colorscheme ayu<cr>

set background=dark
nmap <leader>x :set background=light<cr>
nmap <leader>X :set background=dark<cr>
colorscheme gruvbox

hi CursorLine cterm=bold guibg=#333333
hi LineNr guifg=#CCCCCC
