+++
title = "Reading my Maildir"
date = "2009-01-11T10:17:00+12:00"
categories = ["IT"]
slug = "reading-my-maildir"
draft = "False"
+++
Having downloaded my emails from [gmail](https://gmail.com/) (so I can
have a backup), how do I read them (in case gmail goes down).

We'll I've elected to use [mutt](https://www.mutt.org/), which is a nice
piece of software based on the "Worse is better" principle. As the
author of mutt says:

> "All mail clients suck. This one just sucks less." ---me, circa 1995

Most of the configuration for mutt can be done through the .muttrc
file. Mine is like this:

    set mbox_type=Maildir
    set folder="\~/Gmail-archive"
    set spoolfile="\~/Gmail-archive"
    set mbox="\~/Gmail-archive"
    set mask="!^.[^.]"
    set record="+.Sent"
    set postponed="+.Drafts"
    set reply_regexp="\^(((___SPAM___[t])|[rR][eE]:[ t])\_)+"
    set pager_index_lines=9
    color index brightgreen default \~p \#To me (personal)
    color index yellow default \~N \#New
    color index yellow default \~O \#Old
    bind pager <up> previous-line
    bind pager <down> next-line
    bind pager <left> exit
    bind pager <right> view-attachments
    bind attach <left> exit
    bind attach <right> view-attach
    bind index <right> display-message
    macro index <left> "c?"
    bind browser <right> select-entry
    bind browser <left> exit

The little regex bit remove the ___SPAM___ heading
from messages (that is attached
by our mail system to suspect Spam) if I decide to reply to it. I.e.,
if a mail item is incorrectly classified I don't want the send to be
bothered by the fact it was labelled as-Spam.

