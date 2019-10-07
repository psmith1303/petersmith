+++
title = "Hogging the CPU: Pandoc-crossref is slow"
categories = [
  "Productivity",
  "IT",
]
slug = "hogging-the-cpu-pandoc"
draft = "False"
date = "2016-12-06T16:25:27+13:00"
+++

I have been using GNU make and Makefile from (Kieran
Healy)[https://github.com/kjhealy/pandoc-templates/blob/master/examples/Makefile]
to convert my .md files into .pdf. By magic the process draws on my
.bib file to create the necessary citations and references. That is
all well and good, but my .bib file has over 5,000 items in it. As a
result, pandoc-crossref works really really hard for a long time. And
so the process is a tad slow, to say the least.

With a bit of sluething, the solution seems to be to extract the
required entries from my master .bib file, and put them in a small
(local to each project) .bib file.

The way to do is to use soemthing like (or just use)
(md2bib.py)[https://github.com/hadim/phd_thesis/blob/master/scripts/md2bib.py].
I have tweaked my general purpose Makefile to do just that:

```
## A Makefile in for your markdown-based paper project. 
## Assuming you are using the rest of my templates and toolchain,
## (see https://kieranhealy.org/resources) you can use it
### to create .html, .tex, and .pdf output files (complete with
### bibliography, if present) from your markdown file.
## -    Install the `pandoc-citeproc` and `pandoc-citeproc-preamble`
##      filters for `pandoc`.
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf 
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this. 
## -	You can specify an output format with `make tex`, `make pdf` or 
## - 	`make html`. 
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files 
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## All markdown files in the working directory
SRC = $(wildcard *.$(MEXT))

## Location of Pandoc support files.
PREFIX = /home/psmith/NAS/Templates

## Location of your working bibliography file
SRC_BIB = /home/psmith/NAS/Work/Research/Citations/bibs/psmithLibrary.bib

## CSL stylesheet (located in the csl folder of the PREFIX directory).
CSL = apa

MD=$(SRC)
PDF=$(SRC:.md=.pdf)
HTML=$(SRC:.md=.html)
TEX=$(SRC:.md=.tex)
DOCX=$(SRC:.md=.docx)
BIB=$(SRC:.md=.bib)

all:	$(PDF) $(HTML) $(TEX) $(DOCX) $(BIB)

pdf:	clean $(PDF)
html:	clean $(HTML)
tex:	clean $(TEX)
docx:	clean $(DOCX)
bib:	clean $(BIB)

%.html:	%.md %.bib
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -w html -S \
    --filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble \
    --data-dir=$(PREFIX)/pandoc \
    --template=$(PREFIX)/templates/html.template \
	  --css=$(PREFIX)/marked/kultiad-serif.css \
    --csl=$(PREFIX)/csl/$(CSL).csl \
    --bibliography=$(BIB) \
    -o $@ $<

%.tex:	%.md %.bib
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -w latex -s -S \
		--filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble \
    --data-dir=$(PREFIX)/pandoc \
		--latex-engine=pdflatex \
		--template=$(PREFIX)/templates/psmith_apa.tex \
    --csl=$(PREFIX)/csl/$(CSL).csl \
		--bibliography=$(BIB) \
		-o $@ $<


%.pdf:	%.md %.bib
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S \
		--filter pandoc-crossref --filter pandoc-citeproc --filter pandoc-citeproc-preamble \
    --data-dir=$(PREFIX)/pandoc \
		--latex-engine=pdflatex \
		--template=$(PREFIX)/templates/psmith_apa.tex \
		--csl=$(PREFIX)/csl/$(CSL).csl \
		--bibliography=$(BIB) -o $@ $<

%.docx:	%.md %.bib
	pandoc -r markdown+simple_tables+table_captions+yaml_metadata_block -s -S \
		--filter pandoc-crossref --filter pandoc-citeproc \
    --data-dir=$(PREFIX)/pandoc \
		--csl=$(PREFIX)/csl/$(CSL).csl \
		--bibliography=$(BIB) \
		-o $@ $<



%.bib: %.md
	md2bib.py -f $(MD) -o $(BIB) $(SRC_BIB)


clean:
	rm -f *.html *.pdf *.tex *.bib *.aux *.log *.docx *.out 

.PHONY: clean

```

Now, before the .md gets converted it is scanned to find the
citations, and those are then pulled out of SRC_BIB file, and a local
file is made.

The overall effect is impressive. I used to walk away when 'making' a
.pdf. Now, I barely finish entering `make` and the job is done. Very nice.


