

TEXSRC		= main
INPUT		= literatur.bib $(wildcard *.tex)

LATEX		= latex
BIBTEX		= bibtex
DVIPS		= dvips
PS2PDF		= ps2pdf
PDF2PS		= pdf2ps

STAGEFILES	= run1 run2 run3 run4 run5

all:		$(TEXSRC).ps $(TEXSRC).pdf

clean:	
		rm -f *.aux *.log *.lof *.lot $(TEXSRC).dvi $(TEXSRC).bbl $(TEXSRC).blg $(TEXSRC).toc $(STAGEFILES)

realclean:	clean
		rm -f $(TEXSRC).ps $(TEXSRC).pdf

run1:		$(INPUT)
		$(LATEX) $(TEXSRC) && touch run1

run2:		run1
		$(BIBTEX) $(TEXSRC) && touch run2

run3:		run2
		$(LATEX) $(TEXSRC) && touch run3

run4:		run3
		$(LATEX) $(TEXSRC) && touch run4

run5:		run4
		$(LATEX) $(TEXSRC) && touch run5

$(TEXSRC).ps:	run5
		$(DVIPS) -o $(TEXSRC).ps $(TEXSRC).dvi && rm -f $(STAGEFILES)

$(TEXSRC).pdf:	$(TEXSRC).ps
		$(PS2PDF) $(TEXSRC).ps $(TEXSRC).pdf

