DEPS = *.tex *.sty
DEPS += partie2/*.tex
DEPS += partie3/*.tex
DEPS += images/*.pdf
DEPS += images/*.png

PAGE=$(shell sed -n -e 's/^\\setcounter{cptr}{\(.*\)}/\1/p' preambuleInfoBR.sty)

all: InfoBR.pdf

clean:
	rm -f InfoBR.aux InfoBR.log InfoBR.out InfoBR.toc

distclean: clean
	rm -f InfoBR.pdf

InfoBR.pdf: $(DEPS)
	pdflatex InfoBR.tex
	sed -i -e "s/11/mOtIf/"  InfoBR.toc
	sed -i -e "s/$(PAGE)/11/" InfoBR.toc
	sed -i -e "s/mOtIf/$(PAGE)/" InfoBR.toc
	pdflatex InfoBR.tex

.PHONY: all clean distclean
