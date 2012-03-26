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

# Cette partie vaut si on remplace directement le numéro de la page 11 par celui défini dans preambuleInfoBR.sty m(a
	sed -i -e "s/11/$(PAGE)/" InfoBR.toc
	
## Cette partie vaut si on switche les numéros de la page 11 et de celle sur les crossposts.	
#	sed -i -e "s/11/mOtIf/"  InfoBR.toc
#	sed -i -e "s/$(PAGE)/11/" InfoBR.toc
#	sed -i -e "s/mOtIf/$(PAGE)/" InfoBR.toc
	pdflatex InfoBR.tex

.PHONY: all clean distclean
