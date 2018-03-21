

TEXSRC		= main
INPUT		= ref.bib $(wildcard *.tex)

PDFLATEX	= pdflatex
LATEX		= latex
BIBTEX		= bibtex
HTML		= latex2html

all:		$(TEXSRC).pdf

clean:	
		rm -f *.aux *.log *.lof *.lot *.out *.toc $(TEXSRC).bbl $(TEXSRC).blg  

realclean:	clean
		rm -rf $(TEXSRC).pdf $(TEXSRC).dvi main/

$(TEXSRC).aux:	main.tex
		$(PDFLATEX) $(TEXSRC).tex

$(TEXSRC).bbl:	ref.bib $(TEXSRC).aux
		$(BIBTEX) $(TEXSRC)

$(TEXSRC).pdf:	$(TEXSRC).tex $(TEXSRC).bbl
		$(PDFLATEX) $(TEXSRC).tex
		$(PDFLATEX) $(TEXSRC).tex
		$(LATEX) $(TEXSRC).tex
		$(HTML) -address "Sebastian Jaenicke, `date +%F`" $(TEXSRC).tex
		rm -f main/WARNINGS main/*.pl main/images.*

