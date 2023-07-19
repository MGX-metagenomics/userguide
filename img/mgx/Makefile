

all:		$(patsubst %.svg,%.png,$(wildcard *.svg))

%.png:	%.svg
		rsvg-convert -d 600 $< > $@

