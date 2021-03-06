+++
title = "Telecom - Customer Service of the year (Yeah. Right!)"
date = "2005-10-25T19:45:00+12:00"
categories = ["Jottings"]
slug = "telecom-customer-service-of-the-year-yeah-right"
draft = "False"
+++
I went to use the Jetstream usage meter to day, and instead of the
usual terse message I got:

    ------------------------------------------------------------------------------------------
    Caught SCLMessage exception.
    ------------------------------------------------------------------------------------------
    DETAILS :
    Source Module : IafTranslate.C
    Source Line : 102
    Message Symbol :
    Message Text : error opening language map[./LanguageMap.txt]
    reason[No such file or directory]

Now I had this problem once before about 4 years ago[^1]. It was a nightmare
because most of the people I talked to at Telecom thought the error message was
being generated at my end. In fact it is an error message generated by the
server at Telecom.  ---If only I could remember the fix[^2].

Anyway, I dialed 123 (Telecom's help-desk). After navigating my way through the
menus the system eventually told me to go away (because I'm using someone else
as my ISP).

But the fault isn't with my ISP it is with Telecom.

So, I try 123 again and this time I try the good old _0_ to get an operator. I
get nice music for a few minutes. Then I get a few minutes of ring-tone. Then
the line hangs up!  I try again. Same result. This all takes about 30 minutes.
I dial 123 and this time I pretend to be a customer of Xtra (Telecom's ISP).

The person who answers the phone is keen to tell me my Internet usage, but
doesn't want to take any details of the problem. Instead he says "That belongs
to a different company, they'll look at it tomorrow and get it working". Yeah.
Right. I'm filled with confidence.

I explain to him the problems I had last time getting it fixed. But no, he
doesn't want to do anything else (except mail me my usage).  _Arrgh!_ It will
be interesting to see if it is fixed tomorrow.  For those wondering about the
_Yeah. Right_ comment, it is a Kiwi reference to a series of
[commercials](https://www.istart.co.nz/index/HM20/PC/PV23539/EX2342/CS27126)
for a beer. As in:

> "We'll keep your CV on file"
> 
> "Yeah. Right"

### Update to the story

Okay, I confess. I did try and circumvented the system---perhaps I should have
talked to my ISP. And yes, despite the warnings on the site about enabling
cookies---and I hadn't---and yes, the problem was caused by a lack of cookies.
But seriously, this has to be one of the silliest messages[3] ever for saying
"Turn cookies on".  Having searched
[Google](https://www.google.com/search?q=IafTranslate.C) for the problem, it
seems that not many people encounter this. I wonder why.

[1]: Eventually I found my original
[posting](https://www.unixathome.org/adsl/archives/2001_02/0108.html) to the
[ADSL list](https://www.unixathome.org/adsl/) that chronicles my first encounter of the
problem.

[2]: At the back of my mind I'm thinking, is this a problem with
cookies---surely no error message could be that obscure.  

[3]: The first time I had the problem they had never head of the error message
and I had to figure out the solution myself. You'd think after all this time
Telecom would have a better error message.

