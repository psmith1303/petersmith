+++
title = "Colophon"
date = "2016-11-16T19:14:20+13:00"
categories = ["Site info"]
slug = "colophon"
draft = "False"
weight = 200
+++
As [Brian A. Maicke](https://www.personal.psu.edu/bam49/notebook/colophon/) asks, "So what exactly is a colophon?" Well Google says:

> **colophon**
>
> *ˈkɒləf(ə)n*
>
> noun
>
> * a publisher's emblem or imprint, usually on the title page of a book.
>
> historical
>
> * a statement at the end of a book, typically with a printer's emblem, giving information about its authorship and printing.

How then, is this site put together; or as some other folk might ask, "What's the tool chain for producing this site?"


#### Platform

My platform of choice is [FreeBSD](https://www.freebsd.org/). It is boringly reliable. I can install most any software I need, and it does not need rebooting much (and certainly not as inconsiderately as
Windows 10).

However, these days, my main PC runs Windows 10, and I run Debian under WSL2 for all my 'unix' needs.

That being said, I host the site via [Netlify](https://netlify.com). The current status of my build is: [![Netlify Status](https://api.netlify.com/api/v1/badges/cf268698-6366-4bb2-9b47-e4543db35806/deploy-status)](https://app.netlify.com/sites/petersmith/deploys)

Hey, its all static content so no heavy lifting is required.

#### Writing: Emacs

After many years of being a vi/vim user, I am now getting to grips with the beast that is [Emacs](https://www.gnu.org/software/emacs/). I got into Emacs so that I could experience the joys of [orgmode](https://orgmode.org/).

#### Site Generation: Hugo

I have used many ways of generating sites. Oringally, I hand-coded HTML. Then came a templating engine. Then---for many years---there was MovableType. That was followed by Wordpress. More recently, in an effort to keep things simple and stable--I have moved to having a static site. At first that was [Pelican](https://blog.getpelican.com/) (because I knew python), but more recently I have gone with [Hugo](https://gohugo.io/). It is quick to rebuild my site and has no real dependencies.

#### Responsive Layout: Foundation

My orginal Hugo theme came from [Kieran Healy](https://kieranhealy.org/), and he used the [Kube CSS framework](https://imperavi.com/kube/) from [Impervari](https://imperavi.com/). As I redesigned the site, I have stuck with the same [CSS](https://en.wikipedia.org/wiki/Cascading_Style_Sheets) framework. Nothing fancy, just plain-ole CSS.

#### Fonts

My font choice is the default provided by Kube. [Font Awesome](https://fontawesome.io/) provides the scalable icons, as they do for so much of the web.

