let g:livepreview_previewer = 'zathura'

au BufWritePost *.tex :silent! Start! pdflatex main.tex && pdflatex *.tex && biber main && latexmk -c main.tex
