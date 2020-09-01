" Tags
command! MakeTags !ctags -R .

" Filetypes
au BufRead,BufNewFile *.tex set filetype=tex

" LaTeX shit
"autocmd BufAdd,BufNew,FocusGained,BufEnter,BufNewFile,VimEnter *.tex set conceallevel=0
