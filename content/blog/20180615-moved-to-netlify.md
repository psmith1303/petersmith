+++
title = "Moved to Netlify"
date = 2018-06-15T12:07:19+12:00
draft = "False"
categories = [ 
	"Blogging", 
	"IT", 
	]
+++

I have finally moved all my websites to being hosted on
[Netlify](https://www.netlify.com/). They all now have SSL
certificates (via [Letsencrypt](https://letsencrypt.org/)) and so
https works as it should.

To make it all happen, I also moved to using
[Cloudflare](https://letsencrypt.org/] as my DNS provider. It makes
the provisioning of SSL certificates from Letsencrypt much cleaner (as
verification is done automatically through an API to the DNS, rather
than by creating files on the web server).

To glue everything together, I've put all the 'source' of my sites
onto [GitHub](https://github.com). That allows automatic deployment
from Netlify when I commit changes.

All pretty good and easy (in hindsight).
