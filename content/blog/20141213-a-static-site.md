+++
title = "A static site"
date = "2014-12-13T16:18:00+12:00"
categories = ["Jottings"]
slug = "a-static-site"
draft = "False"
+++
In a possibly vain attempt to simplify my life, I am moving most of my sites
to a lightweight platform. Specifically, I'm going away from
[Wordpress](https://wordpress.org/) and moving to 
[Pelican](http://blog.getpelican.com/).

It all started when it fell due to renew [The Woolseys](http://thewoolseys.com).
The site has been moribund for sometime, and I was going to close
it down, but some of the content is still meaningful. It had
been running on [MovableType](https://movabletype.org/) but
my sense was it was not as well supported as it had been.

So, I thought I'd 'quickly' convert the site to a static instance.
That way it would be a lot less susceptible to the endless hacking
attempts.A little bit of Googling, some work with _wget_ and I 
was done. It was then that I began to think about my other sites. 

They all take time to maintain. Every time I go there, there is yet 
another update (either to WordPress or it's themes, or it's plugins).
I always feel obliged to do them just in case the update is fixing 
a vulnerability. I suspect that most of the time I'm getting new 
features along with any fixes, but ... it's all a bit of a pain.

As a result, I started looking around for alternatives. At first I 
thought about [Ghost](https://ghost.org/) running on top of 
[node.js](http://nodejs.org/). In fact I even upgraded my hosting at 
[A2 Hosting](http://www.a2hosting.com) to allow me to run it. 
But, once again it felt 'heavy' (and I could not quite figure out
some of the templating stuff because not all the data is presented
to all of templates).

Anyway, with the help of Dr Google, I have a working process in 
place for converting my old sites.

There were three difficult parts to the process. First, there were 
the Unicode characters that are scattered through the exported data 
from WordPress. These include soft-hyphen (optional hyphens), 
curly quotes and double quotes, em-dashes, and many more. That 
took a bit of scripting with Vim.

There was also a pile of half converted Textile data (from before the 
sites were based on WordPress ... from when they were MovableType). 
[Pandoc](http://johnmacfarlane.net/pandoc/) helped with that. But, 
that put Unicode characters back in the files. Back to scripts with Vim.

I still need to go through ever post and check for the odd little 
conversions that aren't right. But I think I'm pretty much there now.

Yay!
