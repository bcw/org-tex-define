.PHONY: all clean

PUBLISH = emacs --script publish.el

all:
	$(PUBLISH)

clean:
	rm -rf *.html *.md *.pdf *.tex
