+++
title = "Orgmode: Part 1"
date = "2010-01-17T11:39:00+12:00"
categories = ["Productivity"]
slug = "orgmode-part-1"
draft = "False"
+++
I've been a big fan and user of [Remember the
milk](http://www.rememberthemilk.com/). I found it a great way to manage my
task, and so on, in a [GTD](http://www.davidco.com/) like manner. As a bit of
an aside, the GTD methodology really works for me ... and every time I find
work getting a bit out of control its because I've not been ruthlessly applying
the principles of GTD.

Anyway, I've switched to using org-mode (aka orgmode). I don't recall how I
stumbled across [Org-Mode: Your Life in Plain Text](http://orgmode.org/). No
before I go any further, let me say that I don't think orgmode it for everyone.
Its an extension to the [emacs text
editor](http://www.gnu.org/software/emacs/), and in this
[WYSIWYG](http://en.wikipedia.org/wiki/WYSIWYG) world a texted based programme
may be "a bridge to far'. But, as an old hand a unix (albeit a
[vi/vim](http://www.vim.org/) user) the transition to emacs hasn't been too
hard.

But why change? Is this just part of the ongoing search for the perfect tool
\[Andrew might comment here\]? Is it just displacement behaviour (avoiding
doing PhD work)?

As I said at the beginning of this post, when I find things spinning a
little out of control (or what I've come to regard as control) it's
because my GTD system isn't out of date/wack. So, moving to a new
central store (orgmode) is a mechanism for me to get things back in
order (and on track). So, today I've finished the migration from
Remember the Milk to orgmode. No doubt I'll have some ongoing tweaking
of orgmode ... but I have deleted my Remember the Milk account.

There are lots of useful resources on using orgmode in a GTD way. For
example, [this
one](http://members.optusnet.com.au/\~charles57/GTD/orgmode.html), [this
one](http://www.newartisans.com/2007/08/using-org-mode-as-a-day-planner.html)
or [this one](http://www.linuxjournal.com/article/9116). Most of the articles
assume you already have emacs up an running (which isn't hard), and that you
know how to configure emacs (which is harder).  Fortunately, emacs now ships
with orgmode included, so there isn't a lot of additional work that needs to be
done. you can just jump right on in.

Orgmode understands lists and dates ... and a whole lot more; but lists and
dates are enough to get started with.

First of all, one needs to turn on orgmode. There are a few ways to do this. I
do it thought my .emacs file (which, is normally in your home directory; if it
    isn't there you can create it). In .emacs I have the following text.

    ;; 
    ;; Peter's setup for orgmode in .emacs 
    ;; 
    (add-to-list "auto-mode-alist '(".(org|org_archive|txt)" .  org-mode))
    (global-set-key "C-cl" 'org-store-link) 
    (global-set-key "C-ca" 'org-agenda) 
    (global-set-key "C-cb" 'org-iswitchb) 
    (add-hook 'org-mode-hook 'turn-on-font-lock) ; Org buffers only 
    (setq org-log-done t)  
    ;; 
    ;; Some more settings 
    ;; 
    (setq org-agenda-files (file-expand-wildcards "\~/org/\_.org")) 
    ;; 
    ;; 
    ;;quickly open my gtd file - "M-x gtd" 
    ;; 
    (defun gtd () (interactive) (find-file "\~/org/gtd.org") ) 
    ;;

The main parts of this code are (1) the first line turns on orgmode for
any file that is ends with .org .txt or .org_archive. (2) I keep all
my orgmode files in a directory off my home directory, i.e., \~/org. any
files ending in .org in that directory are scanned when orgmode puts
together my agenda. (3) The last little bit of code opens my main "to
do' file called gtd.org when I execute M-x gtd (for non-emacs users
that means pressing ALT-x then typing gtd and pressing return). This
provides me with a quick way to get to my my to do list. Oh, the "org-log-done"
line results in my to do items getting a date attached to them when I
mark them as being done.

Now for some fun stuff. First I create my gtd.org file (using _c-x
c-w org/gtd.org_ ... that means Control-c Control-x and then typing the
path/file name). I can then start making my to do list, vis:

    _ Work 
    __ Review APR 
    __ Revise article on governance 
    __ Order textbook for INTBUS 202 
    _ Home 
    __ Pick up milk on way home 
    __ Buy a copy "The Wire" (Series 5).

So far so good. I have to have my APR review done by Monday, so let's
put a deadline beside it. Positioning my cursor somewhere on the
relevant line I type _c-c c-d mon_ (and press enter)
The line changes to be:

    ** Review APR DEADLINE: <2010-01-18 Mon>

And I what to schedule doing the article revision on _next_ Monday.
So, on the appropriate line, I type _c-c c-d +2mon_ (and enter). The
line changes to be:

    ** Revise article on governance DEADLINE: <2010-01-25 Mon>

I also want to schedule buying "The Wire" today. On the correct line I
type _c-c s_ and press enter. The line changes to be:

    ** Buy a copy "The Wire" (Series 5). SCHEDULED: <2010-01-16 Sat>

Now I have dozens of tasks to do. And looking at them all at once
doesn't always add clarity. So let's look at my agenda. Pressing _c-c a a_ 
will bring it up (no need to press enter). My agenda looks like:

    Week-agenda (W02): 
    Monday 11 January 2010 W02 
    Tuesday 12 January 2010
    Wednesday 13 January 2010 
    Thursday 14 January 2010 
    Friday 15 January 2010 gtd: Scheduled: Buy a copy "The Wire" (Series 5). 
    Saturday 16 January 2010 
    Sunday: 17 January 2010 gtd: In 1 d.: Review APR gtd: In 8 d.: Revise article on governance

And that's probably enough examples for now. So to sum up, _c-c c-d_
marks an item with a deadline, _c-c c-s_ marks an item with a
scheduled date. Oh, and to save your file (the currently open buffer)
use _c-x c-s_

