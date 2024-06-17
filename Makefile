SVG_FILES = $(shell find ./ -type f -name '*.svg')
HTML_FILES = $(shell find ./ -type f -name '*.html')
TTF_FILES = $(shell find ./ -type f -name '*.ttf')
WOFF_FILES = $(shell find ./ -type f -name '*.woff')
WOFF2_FILES = $(shell find ./ -type f -name '*.woff2')
SVG_GZ_FILES = $(addsuffix .svg.gz, $(basename $(SVG_FILES)))
HTML_GZ_FILES = $(addsuffix .html.gz, $(basename $(HTML_FILES)))
TTF_GZ_FILES = $(addsuffix .ttf.gz, $(basename $(TTF_FILES)))
WOFF_GZ_FILES = $(addsuffix .woff.gz, $(basename $(WOFF_FILES)))
WOFF2_GZ_FILES = $(addsuffix .woff2.gz, $(basename $(WOFF2_FILES)))

GZIP_COMMAND = gzip -k -9

.PHONY: all
all: $(SVG_GZ_FILES) $(HTML_GZ_FILES) $(TTF_GZ_FILES) $(WOFF_GZ_FILES) $(WOFF2_GZ_FILES)

%.gz: %
	@echo "* Compressing $?"
	@$(GZIP_COMMAND) $< -f

clean:
	rm -f $(SVG_GZ_FILES) $(HTML_GZ_FILES) $(TTF_GZ_FILES)
