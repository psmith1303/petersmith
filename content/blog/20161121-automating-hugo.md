+++
date = "2016-11-21T18:48:19+13:00"
title = "Automating Hugo"
Categories = ["IT"]
slug = "automating-hugo"
+++
I'm starting to live in Emacs, and so I wanted to automate---a bit---the way in which I create posts.

So, I took a bit of code from https://wmanger.com/ and mixed in a lot of code from [Toke Høiland-Jørgensen](https://blog.tohojo.dk/2015/10/integrating-hugo-into-emacs.html). The result is something that, creates a file and opens it with the minimal [Hugo frontmatter](https://gohugo.io/content/front-matter/). For this post the front matter looks like this:

	+++
	date = "2016-11-21T18:48:19+13:00"
	title = "Automating Hugo"
	+++

So far, so good. But I want to have something a little more 'complete'.

I could use some clever stuff like snippets to do, but instead I just tweaked the file `archetypes/blog.md` to look like this:

	+++
	categories = [ "Jottings", "Blogging", "The Arts", "Out and about", "Running", "Fitness", "Learning", "Teaching", "Case teaching", "Plagiarism", "Research", "Writing", "Data analysis", "Productivity", "IT", "Technology" ]
	slug = ""
	draft = "False"
	+++

This will magically get merged with the date and title.
