.PHONY: all clean texfirst texsecond builddir refs

builddir:
  mkdir -p build

texfirst: ${IMAGES} | builddir
  xelatex -output-directory=build poster.tex

refs: texfirst
  cp ./bibliography.bib ./build
  cd ./build ; pwd ; bibtex poster.aux

texsecond: refs
  xelatex -output-directory=build poster.tex

clean:
  rm -r build/

all: texsecond
