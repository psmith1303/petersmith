+++
title = "Letsencrypt"
date = 2018-06-10T14:55:08+12:00
draft = "False"
categories = [ 
	"IT", 
	"Technology"
	]
+++

So SSL is here. Yes, I'm late to the party on this one. But time to
get it working on a few things.

None of these services are exposed to the outside world, but I thought
I'd be a tidy kiwi and learn how to do this thang.


#### Setting up my router

First, on my Edgerouter, I followed the instructions
from [j-c-m](https://github.com/j-c-m/ubnt-letsencrypt). It uses the
good'ol bash script
from [Neil Pang](https://github.com/Neilpang/acme.sh), plus j-c-m's
own code.

To use acme.sh when you don't have a webserver, per se, it's necessary
to do stuff on your DNS. It's much easier if your DNS has some kind of
API.
Alas, [NameCheap](https://namecheap.com/] (my current DNS provider)
doesn't, so I move my DNS records over
to [CloudFlare](https://dash.cloudflare.com/). Pretty straightforward.
Then it was down to work on the Edgerouter.


1.  I had already setup static host mapping for FQDN to the LAN IP.

	```
    set system static-host-mapping host-name router.example.com inet 192.168.1.1
	```

2. Configure cert-file location for gui.

	```
    set service gui cert-file /config/ssl/server.pem
    set service gui ca-file /config/ssl/ca.pem
	```

3. Configure task scheduler to renew certificate automatically; who doesn't like automatic updates.

	```
    set system task-scheduler task renew.acme executable path /config/scripts/renew.acme.sh
    set system task-scheduler task renew.acme interval 1d
    set system task-scheduler task renew.acme executable arguments '-d subdomain.example.com'
	```
4. Initialize your certificate.

	```
    sudo /config/scripts/renew.acme.sh -d router.example.com
	```


5. Commit and save your configuration.

	```
    commit
    save
	```

6.  Access your router by going to https://router.example.com/

Done

#### Setting up NAS

Next stop was my FreeNAS box. For this I followed the very helpful instructions (and scripts) from [danb35](https://github.com/danb35/deploy-freenas).

There were a few things that fooled me for a while. After my first attempt, when I ran `deploy_freenas.py` I kept trying to install certificates, only to have it fail with a `Response 400` error. After putting in some debug code, I realised it was because I already had certificates --- the code names the certificates on any particular day with the same name. Once I deleted the certificates on FreeNAS things were better. Except ...

... at the end of the freenas.py script, it reset the webserver on the FreeNAS the subsequent broken connection to the server  gave an error. Specifically, I got something like this:

```
# ./deploy_freenas.py
Certificate import successful
Certificate list successful
Setting active certificate successful
Traceback (most recent call last):
File "./deploy_freenas.py", line 101, in
auth=(USER, PASSWORD),
File "/usr/local/lib/python2.7/site-packages/requests/api.py", line 112, in post
return request('post', url, data=data, json=json, **kwargs)
File "/usr/local/lib/python2.7/site-packages/requests/api.py", line 58, in request
return session.request(method=method, url=url, **kwargs)
File "/usr/local/lib/python2.7/site-packages/requests/sessions.py", line 508, in request
resp = self.send(prep, **send_kwargs)
File "/usr/local/lib/python2.7/site-packages/requests/sessions.py", line 618, in send
r = adapter.send(request, **kwargs)
File "/usr/local/lib/python2.7/site-packages/requests/adapters.py", line 490, in send
raise ConnectionError(err, request=request)
requests.exceptions.ConnectionError: ('Connection aborted.', BadStatusLine("''",))

```

Anyway, I modified the code to catch the error so it wouldn't cause the programme to crash.  In particular I changes the code at the end of the programme to be:

```python

# Reload nginx with new cert

try:
  r = requests.post(
    PROTOCOL + DOMAIN_NAME + '/api/v1.0/system/settings/restart-httpd-all/',
    auth=(USER, PASSWORD),
  )
except (urllib3.exceptions.ProtocolError, http.client.RemoteDisconnected, requests.exceptions.ConnectionError):
  print("Server reset ... as expected")
  
```

But that didn't work too well, until I added an import or two at the front of the code. I.e.,

```python
#
# Some libs just for error handling
#
import urllib3, http
```

So that's all well and good.

As an side, I setup a static site saying, "This is not the website your looking for" for anyone coming to my site (well trying to go through the Edgeroute).

Now to get certificates working on my real websites---here at https://petersmith.org/
