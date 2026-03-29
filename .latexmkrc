# Use xelatex (as specified in dissertation.tex)
$pdf_mode = 5;          # xelatex -> pdf
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$bibtex_use = 2;        # run bibtex automatically
$pdf_previewer = 'open -a Preview';
