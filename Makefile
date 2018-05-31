SVG_FILES = $(shell find ./ -type f -name '*.svg')
HTML_FILES = $(shell find ./ -type f -name '*.html')
SVG_GZ_FILES = $(addsuffix .svg.gz, $(basename $(SVG_FILES)))
HTML_GZ_FILES = $(addsuffix .html.gz, $(basename $(HTML_FILES)))

GZIP_COMMAND = gzip -k -9

.PHONY: all
all: $(SVG_GZ_FILES) $(HTML_GZ_FILES)

# zstd keeps timestamp so we have to touch it, silly zstd... =)
%.svg.gz: %.svg
	@echo "* Compressing $?"
	@$(GZIP_COMMAND) $< -f
	@touch $@

%.html.gz: %.html
	@echo "* Compressing $?"
	@$(GZIP_COMMAND) $< -f
	@touch $@

clean:
	rm -f $(SVG_GZ_FILES) $(HTML_GZ_FILES) $(SVGZ_FILES)
