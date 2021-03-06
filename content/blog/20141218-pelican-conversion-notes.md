+++
title = "Pelican conversion notes"
slug = "pelican-conversion-notes"
date = "2014-12-18T14:21:00+12:00"
categories = ["IT"]
draft = "False"
+++
The basic process I used for converting my WordPress data was to:

1. Export the XML from WordPress
2. Run the import ``pelican-import --markup markdown --wpfile -o content/ --dir-page petersmithjournal.wordpress.2014-12-09.xml``
3. Use pandoc to get rid of remaining textile markup. ``remove_textile.sh``
4. Fix-up Unicode and other matters. ``remove_unicode.sh``
5. Change the filenames so they begin with a date. ``fixup_import.sh``
6. Adjust categories.``python wp_import_fixup.py``

remove_textile.sh


	#
	# Remove textfile markup
	#

	for file in _md
	do
	 echo Processing $file
	 pandoc -f textile -t markdown -o $file.tmp $file
	 mv $file.tmp  $file
	done

remove_unicode.sh


	#
	# Fix up unicode and other problems in markdown files
	#

	for file in _md
	do
	echo Processing $file
	vim -E -s $file <<-EOF
	:%substitute/\%xe2\%x80\%x9d/"/g
	:%substitute/\%xe2\%x80\%xbb//g
	:%substitute/\%xe2\%x80\%x92/-/g
	:%substitute/\%xe2\%x80\%x93/--/g
	:%substitute/\%xe2\%x80\%x94/---/g
	:%substitute/\%xe2\%x80\%x95/-/g
	:%substitute/\%xe2\%x80\%x98/'/g
	:%substitute/\%xe2\%x80\%x99/'/g
	:%substitute/\%xe2\%x80\%x9c/"/g
	:%substitute/\%xe2\%x80\%x9d/"/g
	:%substitute/\%xe2\%x80\%x8b//g
	:%substitute/\%xe2\%x80\%xa6/.../g
	:%substitute/\%xe2\%x84\%xa2/(tm)/g
	:%substitute/\%xc2\%xad//g
	:%substitute/\%xc2\%xa0/-/g
	:%substitute/\%x0d//g
	:%substitute/<span\_.class="caps">\(\_.[A-Z,1-9]_\)\_.<\/span>/\1/g
	:%substitute/\\\# /#/g
	:%substitute/\\\_/_/g
	:update
	:quit
	EOF

	sed -i '' 's/\\$//' $file 
	sed -i '' 's/\\\\//g' $file 
	done

fixup_import.sh

	#!/bin/bash -e
	for i in _.md
	do
		date=$(head -10 $i | grep "^Date:" | awk '{print $2}')
		year=$(echo $date | awk -F \- '{print $1}')
		month=$(echo $date | awk -F \- '{print $2}')
		day=$(echo $date | awk -F \- '{print $3}')
		slug=$(head -10 $i | grep "^Slug:" | awk '{print $2}')
		newname="${year}-${month}-${day}-$slug.md"
		echo $newname
		mv $i $newname.md
	done

wp_import_fixup.py


	#!/usr/bin/env python
	"""
	Script to fix hilighted code blocks from WordPress wp-syntax plugin.

	WordPress wp-syntax plugin (https://wordpress.org/extend/plugins/wp-syntax/)
	uses a "lang" attr on pre tags to define the syntax hilighting, like:

	    <pre lang="bash">
	    something="foo"
	    </pre>

	When pelican-import runs this through Pandoc to produce MarkDown, it comes out
	as a weird and meaningless block like:

	    ~~~~ {lang="bash"}
	    something="foo"
	    ~~~~

	This script takes file path(s) as arguments, and converts this junk
	into proper MarkDown notation. It CHANGES FILES IN-PLACE.

	REQUIREMENTS:

	"""

	import os
	import sys
	import re

	from pygments import lexers

	files = sys.argv[1:]

	"""
	translation of GeSHi identifiers to Pygments identifiers,
	for GeSHi identifiers not supported by Pygments
	"""
	overrides = {'none': 'text', 'lisp': 'common-lisp', 'html4strict': 'html'}
	overrides['xorg'] = 'text'
	overrides['nagios'] = 'text'

	"""
	Mapping of WP categories to new blog categories, for any that change.
	"""
	categories = {}
	categories['Strategy'] = 'Research'
	categories['Seminars'] = 'Research'
	categories['PhD'] = 'Research'
	categories['Hypotheses'] = 'Research'
	categories['Running'] = 'Fitness'
	categories['Health'] = 'Fitness'
	categories['Readings'] = 'Research'
	categories['Quick reference'] = 'Jottings'
	categories['Blogging'] = 'Jottings'
	categories['MBA'] = 'Jottings'
	categories['Out and about'] = 'Jottings'

	def translate_identifier(lexers, overrides, i, fname=None):
	    """
	    Translate a wp-syntax/GeSHi language identifier to
	    a Pygments identifier.
	    """
	    if i in lexers:
		return lexers[i].lower()
	    if i in overrides:
		return overrides[i]
	    sys.stderr.write("Unknown lexer, leaving as-is: %s" % i)
	    if fname is not None:
		sys.stderr.write(" in file %s" % fname)
	    sys.stderr.write("\n")
	    return i

	def get_lexers_list():
	    """ get a list of all pygments lexers """
	    d = {}
	    ls = lexers.get_all_lexers()
	    for l in ls:
		d[l[0]] = l[0]
		for n in l[1]:
		    d[n] = l[0]
	    return d

	def translate_category(i):
	    """ translate a category name """
	    if i in categories:
		return categories[i]
	    return i

	lang_re = re.compile(r'^~~~~ {lang="([^"]+)"}$')
	cat_re = re.compile(r'^Category: (.+)$')

	lexers = get_lexers_list()

	for f in files:
	    content = ""
	    inpre = False
	    count = 0
	    with open(f, "r") as fh:
		for line in fh:
		    m = cat_re.match(line)
		    if m is not None:
			line = ("Category: %s\n" % translate_category(m.group(1).strip()))
			content = content + line
			continue
		    m = lang_re.match(line)
		    if m is not None:
			line = ("~~~~{.%s}\n" % translate_identifier(lexers, overrides, m.group(1), fname=f))
			inpre = True
			count = count + 1
		    elif inpre and line.strip() == "~~~~":
			inpre = False
		    content = content + line
	    with open(f, "w") as fh:
		fh.write(content)
		fh.flush()
		os.fsync(fh.fileno())
	    print("fix_wp-syntax.py: fixed %d blocks in %s" % (count, f))
	# done


I should note that none of this is my orginal work. I found and tweaked many helpful sources from the web.
