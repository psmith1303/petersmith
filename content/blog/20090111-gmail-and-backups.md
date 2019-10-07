+++
title = "Gmail and backups"
date = "2009-01-11T07:40:00+12:00"
categories = ["IT"]
slug = "gmail-and-backups"
draft = "False"
+++
I tend to keep all my email. In fact, I've been doing that since 1999.
The [University of Auckland Business School](https://www.business.auckland.ac.nz/) 
uses Exchange and puts quotas on the amount of mail that each individual 
can store. Although, over the years, the size of the quota has increased, 
it isn't enough to allow me to keep all my email. So, I've been using 
a PST file to keep all my old mail (i.e., mail that
isn't current for this year). That PST file
is now over 3Gb (which I suppose isn't much in the scheme of things),
but it is a constant source of worry to our IT folks.

I've often wondered how else I might store the messages, and I think I
might put them all up on [gmail](https://gmail.com). Although gmail is
reliable, it isn't 100%, so if I do use it as my mail archive, I also
want a separate backup.

Having looked around, I think I might use
[getmail](https://pyropus.ca/software/getmail/) to copy my email from
gmail into a [maildir](https://en.wikipedia.org/wiki/Maildir)
Roughly, I followed the instructions from [George
Donnelly](https://georgedonnelly.com/unix/how-to-quickly-set-up-a-daily-backup-of-your-gmail-account)

I tweaked a couple of things. My rcfile (getmail.gmail) looks like
this:

    [retriever]
    type = SimplePOP3SSLRetriever
    server = pop.gmail.com
    username = myname@gmail.com
    password = mypassword
    [destination]
    type = Maildir
    path = \~/Gmail-archive/
    [options]
    #print messages about each action (verbose = 2)
    #Other options:
    #0 prints only warnings and errors
    #1 prints messages about retrieving and deleting messages only
    #verbose = 2
    verbose = 2
    received = false
    delivered_to = false
    message_log = \~/.getmail/gmail.log

Now all I need to do, is decide if I really want to upload my whole
email archive to google ...

