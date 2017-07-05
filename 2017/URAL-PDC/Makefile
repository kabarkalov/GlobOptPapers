.PHONY: all clean texfirst texsecond builddir refs

builddir:
	mkdir -p build

texfirst: ${IMAGES} | builddir
	pdflatex -output-directory=build u_pdc_paper.tex

refs: texfirst
	cp ./u_pdc_refs.bib ./build
	cd ./build bibtex u_pdc_paper

texsecond: refs
	pdflatex -output-directory=build u_pdc_paper.tex
	cp ./build/u_pdc_paper.pdf ./

clean:
	rm -r build/

all: texsecond
