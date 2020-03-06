+++
title = "Ubiquiti installation"
date = 2018-05-24T19:19:55+12:00
draft = "False"
categories = [ 
	"IT", 
	"Technology"
	]
+++

So I have
faster [Internet]({{< relref "20180521-faster-internet.md" >}}). How
to take advantage of it?

Step 1. Upgrade my modem (*cough* *cough*)

Step 2. Upgrade my wiring

### Upgrading my modem ###

Bye bye ASUS RT-AC58U, hello Ubiquiti.

I decided to get some professional (or is it prosumer) gear. This mean
a Ubiquiti EdgeRoute 4 and a Ubiquiti Unifi Lite access point. And
I'll need a 8-port Gigabit switch to connect my wiring to the router. Easy.

Kind of. 

Being commercially rated gear, its not as user friendly as having a
single device. There is a web application to control the router.
Another one, plus an iPhone app, to work with the access point. There
is the network manager software (UNMS). 

I've yet to master their unified login manager.

The biggest problem was getting the port forwarding working. In the
end I realised I was forwarding from the wrong interface (not from the
PPPoE interface). Doh! I thought my firewall wasn't working but it was
me all along.

In sorting out that problem, I came across the
website <https://canyouseeme.org/>. Very useful for checking if a port
is open on your external IP address.

I have some learning to do still about the power of this product. And
I'll adopt some good practice (such as putting my IoT devices on a
separate secure LAN).


### Upgrading my wiring ###

Back in 2014 I had my house 'wired'. Turns out the cabling was Cat5
not Cat5e or Cat6. So I can't get my super fast speeds on my desktop.
So, I've asked them to come back and fix it. I wonder how long that
will take.
