+++
date = "2016-03-15T13:40:26+12:00"
title = "More static"
slug = "more-static"
categories = ["Blogging"]
draft = "False"
+++

I was kind of happy using Pelican to publish my (now static) website. However, the way I implemented meant that I actually had three separate 'websites' which where rather independent of one another.

My teaching portfolio looked like this:
![2016 version of my teaching portfolio](/images/2016portfolio.png "2016 Teaching Portfolio website")

Whereas my teaching journal (where I talk about teaching) looked like this:
![2016 version of my teaching journal](/images/2016journal.png "2016 Teaching journal website")

And finally, my little blog looked like this:
![2016 version of my blog](/images/2016blog.png "2016 blog website")

It all worked, but having three sites seemed somewhat messy.  I thought about integrating it all in one Pelican site/configuration. But, there were some things that I did not like. The main one is that Pelican is really a blogging platform more than anything else. Other types of data---publications---would need to be kludged in. So, I started to look for something else.

Having looked at a variety of static site generators, I decided that [Hugo](https://gohugo.io/) could be a good choice. I then searched around for someone using it in a similar way to what I wanted; that how I came across the rather nice site of [Kieran Healy](https://kieranhealy.org/). You can tell that I liked what he had done as I downloaded his git archive of his site and used it as the basis for this site.

There are still some things to do. For example, I need to add in my teaching portfolio and load-up all my (few) publications. But other than then small tasks like that, I think I ready to take the new site live.
