DEPS = *.tex *.sty
DEPS += partie2/*.tex
DEPS += partie3/*.tex

PAGE=$(shell sed -n -e 's/^\\setcounter{cptr}{\(.*\)}/\1/p' preambuleInfoBR.sty)

all : InfoBR.pdf

InfoBR.pdf : $(DEPS)
	pdflatex InfoBR.tex
	sed -i -e "s/11/mOtIf/"  InfoBR.toc
	sed -i -e "s/$(PAGE)/11/" InfoBR.toc
	sed -i -e "s/mOtIf/$(PAGE)/" InfoBR.toc
	pdflatex InfoBR.tex
