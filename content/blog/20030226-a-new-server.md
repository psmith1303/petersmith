+++
title = "A new server"
date = "2003-02-26T11:36:00+12:00"
categories = ["IT"]
slug = "a-new-server"
draft = "False"
+++
I've decided to upgrade the server here. So, I've bought a box from [PB
Technologies](http://www.pbtech.co.nz/), with an 2.5G Pentium CPU, 80GB of
disk, and 512MB of memory. Alas, when started the installation process it kept
hanging when it tried to access the hard disk. The last message on the screen
was:

    _ata0: READ command timeout_.

A quick search on the Internet reveals that the SiS651 controller used
on this particular ASUS motherboard doesn't quiet work well with FreeBSD. 
The only option is to disable DMA on the hard disk driver (which works), but
this slows the drive's performance somewhat.

So, the system is working (albeit slowly) and now I'm into installing
all the software I need (Apache, _etc_).

