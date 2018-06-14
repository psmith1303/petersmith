+++
categories = [
  "Teaching",
  "Technology",
]
slug = "citations-in-bookdown"
draft = "False"
date = "2017-05-31T11:35:56+12:00"
title = "Citations in bookdown"

+++

I using the [bookdown](http://bookdown.org/yihui/bookdown/) package,
to produce my coursebook for BUSINESS 705.

Everything was looking good until I realised my in-text citations were
not looking right when I published the 'book' to my website. Instead
of APA citations like `(Huff, 2009)`, I was getting `(Huff 2009)`; the
comma was missing. Also, page numbers were not displaying correctly.

At first I thought I could add `biblio-style: apalike` to the YAML for
the book, but that---it seems---only affects things going to
Latex/PDF.

My next option was to look at raising an issue
on [GitHub](https://github.com/rstudio/bookdown), but that suggested I
checkout
[StackOverflow](https://stackoverflow.com/questions/tagged/bookdown)
first. No luck there, but I began to wonder if I could do something
with the [CSL](https://en.wikipedia.org/wiki/Citation_Style_Language)
file. On
the
[RStudio](http://rmarkdown.rstudio.com/authoring_bibliographies_and_citations.html) site,
I found a reference to specifying the CSL file in RMarkdown files.

So, in the YAML header of my book I added:

```yaml

csl: apa.csl

```

After placing a copy of apa.cls in the working directory of my book,
all it took was a quick, build and deploy and my citations were
beautifully styled as per APA.

