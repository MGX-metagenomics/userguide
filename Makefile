

TEXSRC		= main
INPUT		= ref.bib $(wildcard *.tex)

LATEX		= pdflatex
BIBTEX		= bibtex

all:		$(TEXSRC).pdf

clean:	
		rm -f *.aux *.log *.lof *.lot *.out *.toc $(TEXSRC).bbl $(TEXSRC).blg  

realclean:	clean
		rm -f $(TEXSRC).pdf cover.pdf

$(TEXSRC).aux:	main.tex
		$(LATEX) $(TEXSRC).tex

$(TEXSRC).bbl:	ref.bib $(TEXSRC).aux
		$(BIBTEX) $(TEXSRC)

$(TEXSRC).pdf:	$(TEXSRC).tex $(TEXSRC).bbl
		$(LATEX) $(TEXSRC).tex

