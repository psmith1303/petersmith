+++
title = "Pelican problems"
slug = "pelican-problems"
date = "2015-11-29T20:39:00+12:00"
categories = ["Blogging"]
draft = "False"
+++
I use Pelican to publish my little [blog](/blog/) and it all works pretty well. If you are reading this, then its working.

However, there is a wee problem with the titles of posts when they contain capitals. Pelican uses the [Typogrify](https://pypi.python.org/pypi/typogrify) library, and when a post has a title with two or more caps, it tries to surround them with a caps tag. Alas, whilst in most instances that would work ok, in the title of a post--which is also a hyperlink--it falls over and produces code that looks like:

         <a href="https://www.petersmith.org/blog/2015/09/running-with-asics/" rel="bookmark" title="Permanent Link to: Running with <span class="caps">ASICS</span>">Running with <span class="caps">ASICS</span></a>

which renders like:

        ASICS">Running with ASICS

Instead of:

        Running with ASICS

I could spend some time fixing it, but I am hoping that someone else will get to it before me :)




