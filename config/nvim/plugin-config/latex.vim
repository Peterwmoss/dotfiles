function! CompileLatex()
    Start! pdflatex -interaction=nonstopmode % ; pdflatex -interaction=nonstopmode *.tex ; [[ -a %:r.bcf ]] && biber %:r ; pdflatex -interaction=nonstopmode %; pdflatex -interaction=nonstopmode %; latexmk -c %
endfunction

au BufWritePost *.tex :silent! call CompileLatex()
