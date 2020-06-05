.PHONY: all clean texfirst texsecond builddir refs release

paper_source_name = optima_paper

builddir:
	 mkdir -p build

texfirst: ${IMAGES} | builddir
	pdflatex -output-directory=build $(paper_source_name).tex

refs: texfirst
	bibtex build/$(paper_source_name).aux

texsecond: refs
	pdflatex -output-directory=build $(paper_source_name).tex
	pdflatex -output-directory=build $(paper_source_name).tex

clean:
	if [ -d "$ build" ]; then rm -Rf build; fi

release: clean all
	cp ./build/$(paper_source_name).pdf ./reid_paper.pdf

all: texsecond
