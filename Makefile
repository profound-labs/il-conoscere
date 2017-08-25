FILE=main

LATEX=lualatex
BIBTEX=bibtex

LATEX_OPTS=-interaction=nonstopmode -halt-on-error

all: document

document:
	$(LATEX) $(LATEX_OPTS) $(FILE).tex

cover-front:
	$(LATEX) $(LATEX_OPTS) cover-front.tex

cover-back:
	$(LATEX) $(LATEX_OPTS) cover-back.tex

html:
	asciidoctor -D output stillness-flowing.adoc

epub:
	./helpers/generate_epub.sh

epub-validate:
	EPUBCHECK=~/bin/epubcheck asciidoctor-epub3 -D output -a ebook-validate main.adoc

mobi:
	./helpers/generate_mobi.sh

chapters-to-asciidoc:
	./helpers/chapters_to_asciidoc.sh

chapters-to-docx:
	./helpers/chapters_to_docx.sh

clean:
	+rm -fv $(FILE).{dvi,ps,pdf,aux,log,bbl,blg}

