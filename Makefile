.DEFAULT: test
.PHONY: site test clean deploy

LESSC = lessc
JEKYLL = jekyll

css: css/pawsnet.css
css/pawsnet.css: $(wildcard _less/*.less) $(wildcard _bootstrap/less/*.less)
	mkdir -p css
	$(LESSC) --compress _less/pawsnet.less >| css/pawsnet.css

site: css
	$(JEKYLL)

test: css
	$(JEKYLL) --auto --serve --safe

clean:
	$(RM) -r _site css
