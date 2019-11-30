.PHONY: all clean texfirst texsecond builddir refs

builddir:
	mkdir -p build

texfirst: ${IMAGES} | builddir
	pdflatex -output-directory=build pavt_paper.tex

refs: texfirst
	bibtex build/pavt_paper.aux

texsecond: refs
	pdflatex -output-directory=build pavt_paper.tex

clean:
	rm -r build/

all: texsecond
