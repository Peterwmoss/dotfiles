let g:livepreview_previewer = 'zathura'

function! CompileLatex()
    Start! pdflatex -interaction=nonstopmode % ; pdflatex -interaction=nonstopmode *.tex ; biber %:r ; latexmk -c %
endfunction

au BufWritePost *.tex :silent! call CompileLatex()
