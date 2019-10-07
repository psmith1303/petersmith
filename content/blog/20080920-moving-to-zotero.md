+++
title = "Moving to Zotero"
date = "2008-09-20T19:44:00+12:00"
categories = ["Research"]
slug = "moving-to-zotero"
draft = "False"
+++
For the past couple of weeks, I've been switching over to
[Zotero](https://www.zotero.org/) for my PhD thesis. With over 300
references and 1,000+ citations this hasn't been a quick task.
Anyway, on Thursday I finally pressed ALT+3
(the key I've set up to insert the bibliography) and was rewarded
with a VB run-time error "6' (Overflow).

It seems that there ---is--- was a bug in the Zotero.dot code. Anyway, a
day later [there was a
fix](https://forums.zotero.org/discussion/4107/word-overflow-when-inserting-bibliography/).
Thanks to Mat Hickman for posting the fix. It was a matter of
changing two variables for INTs to-LONGs.

So, I've now generated my bibliography.

The next step is to check my work. I've produced to text files from my
current (Zotero-ised) version and my Endnote version. There is a
really nice tool, called [WinMerge](https://www.winmerge.org/) that does
a spiffing job of visually showing the differences between the two
text-files.

Sometime later this even, I should have a 'correct' version of my
thesis with all the citations correct from Zotero. Then I can get back
to writing ....

Two little _features_, that I haven't checked on the [Zotero
forums](https://forums.zotero.org/categories/%20) are:

- If a bibliography has been inserted in a document, then
adding/amending citations takes a long time as the bibliography
is recreated, and
- Editing an existing citation, with multiple authors, doesn't
correctly sort the authors (and there seems to be now way to
manually move-them).

Nevertheless, I'm really happy to be using Zotero.

