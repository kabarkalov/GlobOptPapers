.PHONY: all clean texfirst texsecond builddir refs

builddir:
	mkdir -p build

texfirst: ${IMAGES} | builddir
	pdflatex -output-directory=build paper.tex

refs: texfirst
	bibtex build/paper.aux

texsecond: refs
	pdflatex -output-directory=build paper.tex
	pdflatex -output-directory=build paper.tex
	pdflatex -output-directory=build paper.tex

clean:
	rm -r build/
	rm -r pictures/*.pdf

all: texsecond
