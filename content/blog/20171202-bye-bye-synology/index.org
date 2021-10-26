+++
title = "Bye bye Synology"
date = 2017-12-02T13:09:19+13:00
draft = "False"
categories = [ 
	"IT", 
	"Technology"
	]
+++

I have been using a Synology-based NAS as my main file server for a
number of years. It worked pretty well. It was reliable and easy to use. 

I particularly liked how it connected to Google Drive and/or Dropbox
to synchronise files. That made sharing things pretty straightforward.

But Synology boxes have a tendency to be underpowered and rather
expensive it you want a lot of power (and I did).

So, I thought I would try FreeNAS, a ZFS-based system running on top
of FreeBSD (rather than some rather proprietary version of Linux on
the Synology).

I had a box I could run it on, but I soon found I needed to upgrade it
from 8Gb to 16Gb. It was a little too tight memorywise.

FreeNAS is a much more commercial system. By that I mean it is geared
towards 'production' use, rather than home use (which was the case
with the Synology really). So, the system is very powerful, but a
little less easy to use. Actually, there is definitely a bit of a
learning curve (and I've been using FreeBSD for many, many years).

I'm using a similar backing up system (off-site with Rsync), but I
also use Syncthing to move date (in kind of real time) between the
various systems I have at home and at work. 

Syncthing works well, although there have been a couple of times
(during the set-up) where I got conflicts and resolved them the wrong
way (keeping an older version of a file, rather than the newer
version. However, that seems to be behind me now.

So, far, so happy (and that's after about 2 months of use).
