+++
draft = "False"
date = "2017-02-08T09:02:53+13:00"
title = "FreeBSD on a Dell E7450"
categories = [
  "IT",
  "Technology"
]
slug = "freebsd-dell-wifi"
+++

For the recent [Research Bazaar](http://2017.resbaz.com/auckland/), I
needed a laptop with Python, R, bash, etc. So, having borrowed a
laptop from our excellent tech people, I immediately went for my OS of
choice, [FreeBSD](http://www.freebsd.org/). A pretty straight forward
install, except I needed to get the WiFi networking working.

That took a little while to figure out as, at first, the WiFi chip set
seemed unsupported and getting an external USB WiFi adapter working
was challenging as most of those seem to be unsupported too.

Anyway, this was what I did to get a reliable WiFi setup.

First, I needed the drivers for the WiFi chipset in the Dell E7450. It
uses an Intel 7265. In the latest version of FreeBSD there are drivers
but they need to be loaded into the kernel. So, in `/boot/loader.conf`
I added the lines:

	if_iwm_load="YES"
	iw3160fw_load="YES"
	iw7260fw_load="YES"
	iw7265fw_load="YES"
	iw8000cfw_load="YES"

All of those drivers are needed. Just loading the iw7265fw module does
not work.

The interface for the WiFi is not created automatically during the
boot, but we can fix that in `/etc/rc.conf`, by adding the lines:

	wlans_iwm0="wlan0"
	ifconfig_wlan0="WPA DHCP"
	
	
Those two lines create the interface and tells FreeBSD to use good old
DHCP on it (you could use a static address etc if you liked) and to
use `wpa_supplicant` to configure the WiFi. Of course, now we need to
configure the WiFi.

In `/etc/wpa_supplicant.conf`, I added the lines:

	network={
		ssid="home-ssid"
		scan_ssid="1"
		psk="home password"
	}
	network={
		ssid="UoA-WiFi"
		scan_ssid="1"
		key_mgmt=WPA-EAP
		identity="psmi045"
		password="MyPassword"
		eap=PEAP
		phase1="peaplabel=0"
		phase2="auth=MSCHAPV2"
	}
	
The first "network" block, sets things up for my home WiFi network.
All that needs changing for a simple WPA situation is setting the SSID
and the PSK (password). The second "network" block is for use with the
university's WiFi infrastructure; that needs an ID and a password.
With a few tweaks, a similar block could be used for
[EDUROAM](https://www.eduroam.org/), e.g., by adding:

	network={
		ssid="eduroam"
		scan_ssid="1"
		key_mgmt=WPA-EAP
		identity="psmi045@auckland.ac.nz"
		password="MyPassword"
		eap=PEAP
		phase1="peaplabel=0"
		phase2="auth=MSCHAPV2"
	}

Then it's a matter of rebooting. During sorting out all of this, I
created a script to allow me to try stuff out without rebooting all the
time. My `WiFi.sh` looked like:

	ifconfig wlan create wlandev imw0 ssid UoA-WiFi
	wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.
	sleep 20
	dhclient wlan0
	ifconfig wlan0
	
I hope this all helps anyone who ends in a similar situation of
needing to get WiFi working on a Dell laptop ... that said, the
various different models of Dell seem to use a variety of chipsets, so
you might need to look that up first.

I would like to say this is all my own work, but the truth is that it
is a collection of information from around the web.
