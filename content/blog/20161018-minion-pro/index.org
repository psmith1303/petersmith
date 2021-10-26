+++
date = "2016-10-18T15:49:20+13:00"
title = "Minion Pro"
slug = "minion-pro"
categories = ["IT"]
draft = "False"
+++

From time to time, Windows 10, gets updated. It is a fairly automatic process, and that has a number of benefits; such as, security patches are applied quite regularly. The downside of the process is that sometime there is little control as to when the update happens. You might (re-)boot ones PC to find it doing an update, or one might be in the middle of doing something and it starts to shutdown/reboot to do a update. In these cases, for the user, there is little meaningful guidance as to how long the update is going to take (or even how many reboots it might be going to do). In the worst case it can take hours.

So, after one more inconvenient update, I have removed Windows 10 from my main PC, and gone back to FreeBSD (and the new release, 11.0). 

Installation is pretty quick and easy; the basics are done in about 8 minutes. However, there is a rather long list of extra packages I use. In no particular order this include:

* ssmtp -- for simply sending email
* Xorg -- the ubiquitous X-windows programme
* fluxbox -- a X11 windows manager
* nvidia-driver -- I have a rubbishy video card that is not well supported by FreeBSD out-of-box
* xpdf
* poppler-utils
* firefox
* chrome
* hal
* openconnect -- to access the University of Auckland's VPN
* rdesktop -- to access my PC at the office (at work)
* xrdp -- so I can remote desktop in to this machine
* portmaster -- to keep things up today
* portsnap
* filezilla -- a usefule file manager/ftp/scp like programme
* mplayer
* rsync
* mmv
* unzip
* git
* R
* ipython
* go -- so that I can build/install hugo
* bash
* rxvt-unicode -- yet another xterm program
* emacs -- and these are the big tools I tend to use
* texlive-full -- the joy of LaTeX
* inkscape -- vector graphics
* hs-pandoc -- the most excellent file converter
* CRAN-R-Knitr -- mix Markdown and R code together

Some of these can be installed as packages, some have to be complied. Once I have updated FreeBSD and the ports, I have to re-compile them all. That takes a while. There is also a lot of tinkering that then has to go on.

In `login.conf` I set `lang=en_GB.UTF-8` in the default section

My `/etc/rc.conf` looks like:

```
	sendmail_enable="NONE"
	hostname="red"
	ifconfig_re0="inet 192.168.1.100 netmask 255.255.255.0"
	defaultrouter="192.168.1.254"
	sshd_enable="YES"
	ntpd_enable="YES"
	hald_enable="YES"
	dbus_enable="YES"
	xrdp_enable="YES"                                                               
	xrdp_sesman_enable="YES"

	nfs_client_enable="YES"
	rpc_lockd_enable="YES"
	rpc_statd_enable="YES"

	# Set dumpdev to "AUTO" to enable crash dumps, "NO" to disable
	dumpdev="AUTO"
	zfs_enable="YES"
```

And my `/usr/local/share/ssmtp/ssmtp.conf` is:
```
	#
	# /etc/ssmtp.conf -- a config file for sSMTP sendmail.
	#

	# The person who gets all mail for userids < 1000
	# Make this empty to disable rewriting.
	root=postmaster

	# The place where the mail goes. The actual machine name is required
	# no MX records are consulted. Commonly mailhosts are named mail.domain.com
	# The example will fit if you are in domain.com and your mailhub is so named.
	root=psmith@consulting.co.nz                                                    
	mailhub=smtp.sendgrid.net:465                                                   
	AuthUser=XXXXXXXX
	AuthPass=YYYYYYYYY
											
	# Where will the mail seem to come from?                                        
	rewriteDomain=66uqs.org                                                         

	# The full hostname                                                             
	hostname=tiny.66uqs.org                                                         

	# Set this to never rewrite the "From:" line (unless not given) and to          
	# use that address in the "from line" of the envelope.                          
	#FromLineOverride=YES                                                           

	UseTLS=Yes                                                                      
	UseSTARTTLS=No                                                                  
	#UseTLSCert=YES                                                                 
	#TLSCert=/usr/local/etc/ssmtp/ssmtp.pem                                         

	# Get enhanced (*really* enhanced) debugging information in the logs            
	# If you want to have debugging of the config file parsing, move this option    
	# to the top of the config file and uncomment                                   
	Debug=No
```

Then I wanted to set up Emacs to be just the way I like it. And here we get to the tail of the font Minion Pro.

I looked at the nice Emacs started kit from Kieran Healy. In that he goes for Minion Pro, and gives instructions on how to set it up on a Mac. Could I get it set up on FreeBSD. Oh no. I tried all the guides I could find, with no luck. So, I decided to abandon the question for Minion Pro.

As I was backing out my changes, I was typing in `rm -fr /usr/local` and was going on to put the path to a font directory. Well, I accidentally pressed `ENTER`. Cripes! Before I realised what I had done half of my `/usr/local` directory was gone. Time to reinstall ... which is mostly done now.

And doing this entry reminds me that I need to install Hugo ... the static site generator I use for this site.
