.PHONY: all clean texfirst texsecond builddir refs

builddir:
	mkdir -p build

texfirst: ${IMAGES} | builddir
	pdflatex -output-directory=build motor_paper.tex

refs: texfirst
	bibtex build/motor_paper.aux

texsecond: refs
	pdflatex -output-directory=build motor_paper.tex

clean:
	rm -r build/
	rm -r images/*.pdf

all: texsecond
