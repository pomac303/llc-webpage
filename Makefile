SVG_FILES = $(shell find ./ -type f -name '*.svg')
HTML_FILES = $(shell find ./ -type f -name '*.html')
TTF_FILES = $(shell find ./ -type f -name '*.ttf')
WOFF_FILES = $(shell find ./ -type f -name '*.woff')
WOFF2_FILES = $(shell find ./ -type f -name '*.woff2')
SVG_GZ_FILES = $(addsuffix .svg.gz, $(basename $(SVG_FILES)))
SVG_BR_FILES = $(addsuffix .svg.br, $(basename $(SVG_FILES)))
HTML_GZ_FILES = $(addsuffix .html.gz, $(basename $(HTML_FILES)))
HTML_BR_FILES = $(addsuffix .html.br, $(basename $(HTML_FILES)))
TTF_GZ_FILES = $(addsuffix .ttf.gz, $(basename $(TTF_FILES)))
TTF_BR_FILES = $(addsuffix .ttf.br, $(basename $(TTF_FILES)))
WOFF_GZ_FILES = $(addsuffix .woff.gz, $(basename $(WOFF_FILES)))
WOFF_BR_FILES = $(addsuffix .woff.br, $(basename $(WOFF_FILES)))
WOFF2_GZ_FILES = $(addsuffix .woff2.gz, $(basename $(WOFF2_FILES)))
WOFF2_BR_FILES = $(addsuffix .woff2.br, $(basename $(WOFF2_FILES)))

GZ_FILES=$(SVG_GZ_FILES) $(HTML_GZ_FILES) $(TTF_GZ_FILES) $(WOFF_GZ_FILES) $(WOFF2_GZ_FILES)
BR_FILES=$(SVG_BR_FILES) $(HTML_BR_FILES) $(TTF_BR_FILES) $(WOFF_BR_FILES) $(WOFF2_BR_FILES)

GZIP_COMMAND = gzip -k -9
BROTLI_COMMAND = brotli -k -Z

.PHONY: all
all: $(GZ_FILES) $(BR_FILES)

%.gz: %
	@echo "* [gzip] Compressing $?"
	@$(GZIP_COMMAND) $< -f

%.br: %
	@echo "* [brotli] Compressing $?"
	@$(BROTLI_COMMAND) $< -f

clean:
	rm -f $(GZ_FILES) $(BR_FILES)
