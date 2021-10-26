+++
slug = ""
draft = "False"
categories = [
  "Blogging",
  "Running",
  "IT",
]
date = "2017-06-12T16:47:46+12:00"
title = "Smashrun 2 blog"

+++

Having moved away from using Facebook, I wanted to keep a record of my
running, primarily for my own use. Although I do have all my runs
on [SmashRun](https://smashrun.com/peter.smith), I decide to keep my
[runs](https://www.petersmith.org/running/) on this site too.

And so, [BlogMyRun](https://github.com/psmith1303/BlogMyRun) was born.

This python programme allows me to:

* Drag down all my runs from SmashRun and reformat them for
  this [Hugo-based](https://gohugo.io/) blog.
* Drag down runs for the past n-days

My `Makefile` then moves the .md and .png files to the right place on
my filesystem, and then deploys the new posts to the web (in my case,
hosting them on Amazon's S3).

All this was made possible by the very
cool [SmashRun API](https://api.smashrun.com/). I do not have all the
authorization code (or any actually) working yet. I use SmashRun's API
explorer to get the token I need ... see the README.md file for notes
on what to do.

I have also used the Google Static Map API to show the run. It is
customised the way I like it :)

I plan to build an extension to create monthly, 'macro-logs' in a
similar vein to [fellrnr](https://fellrnr.com/wiki/Training_Macrolog).
