# Makefile pour l'infoBR
# Pour que ce soit facile à compiler :)
#

all:
	latex infobr.tex
	dvips -o infobr.ps infobr.dvi
	ps2pdf infobr.ps infobr.pdf

