all: InfoBR2k15.pdf

InfoBR2k15.pdf: couv.pdf page.pdf 4eme.pdf content.ps
	gs -sOutputFile=grayscale.pdf -sDEVICE=pdfwrite -sColorConversionStrategy=Gray -dProcessColorModel=/DeviceGray -dCompatibilityLevel=1.4 -dNOPAUSE -dBATCH content.ps
	gs -o InfoBR2k15.pdf -sDEVICE=pdfwrite couv.pdf page.pdf grayscale.pdf page.pdf 4eme.pdf

	#sed '1,/^%%EndComments/ s/^%%Title:.*/%%Title: InfoBR/' < $<| ps2pdf - $@

#InfoBR.ps: couv.ps page.ps 4eme.ps content.ps
#	a2ps --portrait --columns=1 -o$@ couv.ps page.ps content.ps page.ps 4eme.ps


# Compile d'abord l'infoBR
content.ps: ../InfoBR.pdf
	pdf2ps $< $@

../InfoBR.pdf:
	make -C .. InfoBR.pdf

# Couvertue, page blanche et 4e de couverture
couv.ps: couv.pdf
	pdf2ps $< $@

page.ps: page.pdf
	pdf2ps $< $@

4eme.ps: 4eme.pdf
	pdf2ps $< $@

couv.pdf: couv.tex
	pdflatex $<

page.pdf: page.tex
	pdflatex $<

4eme.pdf: 4eme.tex
	pdflatex $<

# Nettoyage
clean:
	rm -f couv.aux couv.log couv.pdf couv.ps page.aux page.log page.pdf page.ps 4eme.aux 4eme.log 4eme.pdf 4eme.ps \
		content.ps InfoBR.ps grayscale.pdf

distclean: clean
	rm -f InfoBR.pdf

.PHONY: all clean distclean
