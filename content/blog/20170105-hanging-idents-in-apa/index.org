+++
slug = "hanging-indents-in-apa"
draft = "False"
categories = [
  "Writing",
  "Productivity",
  "IT",
]
date = "2017-01-05T13:52:08+13:00"
title = "Hanging idents in APA"

+++

As I have mentioned elsewhere, I am writing using markdown formatted files, and converting them to PDFs using `pandoc` and associated tools. 

Alas, I noticed today that the reference list is produced without hanging indents (which is an APA requirement). Grrr. After some searching, I found that currently `pandoc-citeproc` does not (yet) support hanging indents. However, there is a work around. Currently, my `.md` files end with a couple of lines that look like:

	References
    ==========

What is needed is a little bit of latex 'code' to make the rest of the document use hanging paragraphs --- and thus work. I.e.,

	References
	==========
	
	\setlength{\parindent}{-1.24cm}
	\setlength{\leftskip}{1.24cm}
	\setlength{\parskip}{8pt}

And then I have a beautifully formatted reference list.
