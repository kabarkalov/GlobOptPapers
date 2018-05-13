pdflatex ysc_paper.tex
bibtex ysc_paper.aux
pdflatex ysc_paper.tex
pdflatex ysc_paper.tex
mv ysc_paper.pdf .\build\
rm ysc_paper.log
rm ysc_paper.bbl
rm ysc_paper.out
rm ysc_paper.blg
rm ysc_paper.aux
