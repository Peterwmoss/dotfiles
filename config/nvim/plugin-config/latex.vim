function! CompileLatex()
    Start! pdflatex -interaction=nonstopmode % ; pdflatex -interaction=nonstopmode *.tex ; [[ -a %:r.bcf ]] && biber %:r ; latexmk -c %
endfunction

au BufWritePost *.tex :silent! call CompileLatex()
