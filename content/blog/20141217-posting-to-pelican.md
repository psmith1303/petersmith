+++
title = "Posting to Pelican"
slug = "posting-to-pelican"
date = "2014-12-17T19:54:00+12:00"
categories = ["IT"]
draft = "False"
+++
I've been playing around trying to make the process of posting easier. I've taken an idea from
[Pelican Tips n Tricks](https://github.com/getpelican/pelican/wiki/Tips-n-Tricks) and
modified my Makefile (well, actually, on [FreeBSD](https://www.freebsd.org/) one needs 
to use gmake or similar when using Pelican as its version of make is rather
BSD in orientation).

Anyway, I've tweaked my Pelican created Makefile to include:

	PAGESDIR=$(INPUTDIR)
	DATE := $(shell date +'%Y-%m-%d %H:%M:%S')
	SHORTDATE := $(shell date +'%Y-%m-%d-')
	SLUG := $(shell echo '${NAME}' | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
	EXT ?= md

	newpost:
	ifdef NAME
		echo "Title: $(NAME)" >  $(INPUTDIR)/${SHORTDATE}$(SLUG).$(EXT)
		echo "Slug: $(SLUG)" >> $(INPUTDIR)/${SHORTDATE}$(SLUG).$(EXT)
		echo "Date: $(DATE)" >> $(INPUTDIR)/${SHORTDATE}$(SLUG).$(EXT)
		echo ""              >> $(INPUTDIR)/${SHORTDATE}$(SLUG).$(EXT)
		echo ""              >> $(INPUTDIR)/${SHORTDATE}$(SLUG).$(EXT)
		${EDITOR} ${INPUTDIR}/${SHORTDATE}${SLUG}.${EXT}
	else
		@echo 'Variable NAME is not defined.'
		@echo 'Do make newpost NAME='"'"'Post Name'"'"
	endif


I suspect I could of make things a little cleaner but it works. It allows me to 
do things like:

	gmake newpost NAME='Posting to Pelican'

That will create a file in my _content_ directory called:

> 2014-12-17-posting-to-pelican.md 

I like to date all my filenames to stop any 'clashes' and to reduce the liklihood of me accidently overwriting an old post.

It's a step in the right direction.

Of note, I found out the hard way, that the indents in a gmake Makefile (and presumably in a regular Linux Makefile) have to be TAB characters and not just spaces. That had me going around in circles for a few minutes.
