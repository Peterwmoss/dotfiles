function! CompileLatex()
    Start! pdflatex -interaction=nonstopmode main.tex ; [[ -a main.bcf ]] && biber main ; pdflatex -interaction=nonstopmode main.tex; pdflatex -interaction=nonstopmode main.tex; latexmk -c main.tex
endfunction

au BufWritePost *.tex :silent! call CompileLatex()
