+++
draft = "False"
categories = [
  "Data analysis",
  "IT",
  "Technology",
]
slug = "rstudio-server"
date = "2016-11-25T13:17:32+13:00"
title = "Rstudio Server"
+++
For the analysis work I am doing on _dual allegiances_ I have been using a combination or [R](https://www.r-project.org/) and [R Studio](https://www.rstudio.com/) under Windows. However, it would be useful not to need Windows. R runs quite happily under [FreeBSD](https://www.freebsd.org/) but there is no port of _R Studio_ for FreeBSD. The packages are geared towards Linux, and especially towards [Debian](https://www.debian.org/) and [Ubuntu](https://www.ubuntu.com/). I do not really want another desktop environment, so I was pleased to find the good folk at R Studio make a version that runs on a server, and allows one to work through a browser.

Great. All I need is a Debian-like server.

Fortunately, a spare HP Mini 151 was lying around. Not the most modern or powerful of machines, but I thought it might do. The short answer is "yes". I avoided a GUI, and installed the i386 (32-bit) version of Debian (Jessie). The I installed Emacs 25.1 --- there is no package available, so I had to compile it from source (a painless process). 

Then install the open-source version of [R Studio Server](https://www.rstudio.com/products/rstudio/download-server/), and away I go. 

Of course there are a few R libraries to install, but they required the latest build of R (3.2.2) which was not available from the standard repositories. So, it took some hunting around on the web to figure out how Debian repositories work and where/how to get the latest version of R.

But now, I have a tiny server running internally on my network as a R Studio platform. And with that, I go back to analysing my data.

(Note to self, I wonder if R Studio would run on my Synology NAS --- but then again, I do not want to rock that boat.)
