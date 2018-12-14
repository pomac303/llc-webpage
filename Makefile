SVG_FILES = $(shell find ./ -type f -name '*.svg')
HTML_FILES = $(shell find ./ -type f -name '*.html')
TTF_FILES = $(shell find ./ -type f -name '*.ttf')
SVG_GZ_FILES = $(addsuffix .svg.gz, $(basename $(SVG_FILES)))
HTML_GZ_FILES = $(addsuffix .html.gz, $(basename $(HTML_FILES)))
TTF_GZ_FILES = $(addsuffix .ttf.gz, $(basename $(TTF_FILES)))

GZIP_COMMAND = gzip -k -9

.PHONY: all
all: $(SVG_GZ_FILES) $(HTML_GZ_FILES) $(TTF_GZ_FILES)

%.gz: %
	@echo "* Compressing $?"
	@$(GZIP_COMMAND) $< -f

clean:
	rm -f $(SVG_GZ_FILES) $(HTML_GZ_FILES) $(TTF_GZ_FILES)
