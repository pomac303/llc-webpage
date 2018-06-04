SVG_FILES = $(shell find ./ -type f -name '*.svg')
HTML_FILES = $(shell find ./ -type f -name '*.html')
SVG_GZ_FILES = $(addsuffix .svg.gz, $(basename $(SVG_FILES)))
HTML_GZ_FILES = $(addsuffix .html.gz, $(basename $(HTML_FILES)))

GZIP_COMMAND = gzip -k -9

.PHONY: all
all: $(SVG_GZ_FILES) $(HTML_GZ_FILES)

%.svg.gz: %.svg
	@echo "* Compressing $?"
	@$(GZIP_COMMAND) $< -f

%.html.gz: %.html
	@echo "* Compressing $?"
	@$(GZIP_COMMAND) $< -f

clean:
	rm -f $(SVG_GZ_FILES) $(HTML_GZ_FILES) $(SVGZ_FILES)
