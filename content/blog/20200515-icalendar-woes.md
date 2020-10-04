+++
title = "iCalendar woes"
date = 2020-05-15T16:18:17+12:00
draft = "False"
categories = [ 
	"Productivity", 
	"IT", 
	]
+++

I use the lovely [Orgmode](https://orgmode.org/) for managing a lot of
my tasks, to do lists, projects and so on. It's really very very good.

When reviewing my tasks etc., I thought it would be nice to see what
is in my calendar at the same time. Orgmode's
[Agenda](https://orgmode.org/manual/Agenda-Views.html#Agenda-Views)
can do all of that if you have your appointments and so in your Emacs
calendar.

Here we are good Microsurfs, and so we use Outlook and Exchange.

### Problem 1: Getting my calendar out of Outlook/Exchange. 

Our IT folk have configured things so the default is that you can only
get Free/Busy information when you share calendars. However, they
nicely changed my settings when I explained the reasons for wanting to
export all the details of my calendar.

So, I could now download my calendar as an .ics file.

### Problem 2: Converting the calendar into an Emacs diary file.


There's lots of advice out there on doing this from Gmail, and I
choose the advice from
[Worg](https://orgmode.org/worg/org-tutorials/org-google-sync.html)
which uses an `awk` script called
[ics2cal.awk](https://orgmode.org/worg/code/awk/ical2org.awk). This
work pretty well, and it showed me that it could be done.

### Problem 3: Repeating events are not handled well

This is a limitation of the script. There is a python version that is
a little better, but it's still not right.

In searching around I came across the fact that Emacs can, all by
itself, import .ics files. Yay! I thought.

Rainer at [König von
Haunstetten](https://koenig-haunstetten.de/2017/01/02/google-calendar-integration-in-orgmode/)
explained how to do it. Yes. I thought. I modified his script and gave
it a go. It kind of worked.

### Problem 4: Events are on the wrong day.

When I first ran the script, it all worked expect I events seemed to
be one day out. Dates for the 6th were appearing on the 5th. Hmmm.
Then it stopped working altogether. The script would run without
errors. And stuff would appear in the diary file, but not be displayed
in my agenda. Most odd.

Now, it's probably important to know that my first tests were on the 6
May 2020. Or as the European's would write it 6 5 2020; whereas the
Americans would write 5 6 2020. Ah ah! Whilst the ics file is using
ISO formatted dates, my subsequent diary files seems to be using
American formatted dates. 

I'm English, so I go with the European style; and Emacs is set up that
way to. Or is it.

### Problem 5: Emacs is not set to be using European dates

WTF. It's a fair cop, I'm using Windows 10 having recently migrated
away from FreeBSD (that's a different story). But, for a pile of reasons I don't want to go into here, when I run Emacs in batch-mode, I'm not doing it in plain-old plain-old Windows. No. I'm doing it under [WSL2](https://www.techrepublic.com/article/wsl-2-where-is-it-and-where-is-it-going/).It's actually a different copy/instance of Emacs with an entirely different `.emacs.d` Ah, ha.

Now, how to persuade Emacs under WSL2 to be all European. In the end I modified the script to include the commands not only to run `icalendar-import-file` but also to set `calendar-date-style` to be `European`. Just like this:

getExchangeCalendar.sh

```
#!/bin/bash

# customize these
WGET=/usr/bin/wget
ICS2ORG=/mnt/c/Users/psmith/Dropbox/psmith/bin/ical2org.awk
ICSFILE=/mnt/c/Users/psmith/Dropbox/psmith/Temp/calendar.ics
ORGFILE=/mnt/c/Users/psmith/Dropbox/psmith/Org/exchange-diary
URL=http://mail.here.nz/owa/calendar/917ca3e521345fc9fee5@here.it/37a721c9253d46f59f6c420db2ab1/calendar.ics

# no customization needed below

$WGET -O $ICSFILE $URL

# Creat an empty diary file

rm $ORGFILE

#
# Fix/set the timezone from (no TZ description) to Pacific/Auckland
#
sed -i.bak 's/(no TZ description)/Pacific\/Auckland/' $ICSFILE


#
# Now do the import
#
emacs -batch --eval="(progn (setq calendar-date-style 'european) (icalendar-import-file \"$ICSFILE\" \"$ORGFILE\"))"

```

Oh, I mangled the URL of my calendar ... I don't want everyone reading it 

It all works and I'm a happy camper.
