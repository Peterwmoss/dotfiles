let g:livepreview_previewer = 'zathura'

au BufWritePost *.tex :Start! pdflatex -interaction=nonstopmode % && pdflatex -interaction=nonstopmode *.tex && biber %:r && latexmk -c % 
