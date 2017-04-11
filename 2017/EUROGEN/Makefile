.PHONY: all clean texfirst texsecond builddir refs

builddir:
	mkdir -p build

texfirst: ${IMAGES} | builddir
	pdflatex -output-directory=build eurogen.tex

refs: texfirst
	cp ./bibliography.bib ./build
	cp ./nature.bst ./build
	cd ./build ; bibtex eurogen.aux

texsecond: refs
	pdflatex -output-directory=build eurogen.tex

clean:
	rm -r build/
	#rm -r images/*.pdf

all: texsecond
