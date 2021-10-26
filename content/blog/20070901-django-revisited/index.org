+++
title = "Django revisited"
date = "2007-09-01T20:14:00+12:00"
categories = ["IT"]
slug = "django-revisited"
draft = "False"
+++
Some time ago, [I played around with
Django]({{< relref "20061001-porting-from-movabletype-to-a-django-powered-blog.md" >}}).
Having spent far too much time with writing my own blogging platform, I [gave
up]({{< relref "20061015-blogging-platforms.md" >}}).

In some ways, this was because I couldn't get Django working on [my current
host]({{< relref "20061231-a-new-host.md" >}}).
However, today, I spent a little time getting
[Django](https://www.djangoproject.com/) working at [A2
Hosting](https://www.a2hosting.com/), and this is how I did it.

(A big thanks to [Jeff
Croft](https://www2.jeffcroft.com/blog/2006/may/11/django-dreamhost/) and
[Seamusc](https://seamusc.com/blog/2007/jun/11/how-get-django-working-digiwebie-using-djangocgi/)---they
laid out pretty much what needed to be done).

First of all I set up `www2.petersmith.org` (which
is basically a sub-directory on my host). Let's call the directory DJHOST/www2
Into DJHOST/www2 went .htaccess

    AddHandler cgi-script .cgi
    RewriteEngine on
    RewriteRule \^(cgi-bin/.\_)---[L]
    RewriteRule \^(media/.\_)---[L]
    RewriteRule \^(admin_media/.\_)---[L]
    RewriteCond %{<span class="caps">REQUEST_FILENAME</span>} !-f
    RewriteRule \^(dj.cgi/.\_)---[L]
    RewriteRule \^(.\_) /cgi-bin/dj.cgi/\1 [QSA,L]

I had enless problems, which I eventually traced back to the 
_AddHandler_ line shown above.

Next, I created a cgi directory, i.e.

    mkdir DJHOST/www2/cgi-bin

and in cgi-bin went dj.cgi

    ##!/usr/local/bin/python
    #encoding: utf-8
    """
    django.cgi
    A simple cgi script which uses the django WSGI to serve requests.
    Code copy/pasted from <span class="caps">PEP-0333</span> and then
    tweaked to serve django.

    https://www.python.org/dev/peps/pep-0333/\#the-server-gateway-side


    This script assumes django is on your sys.path, and that your site code
    is at
    /home/mycode/mysite. Copy this script into your cgi-bin directory (or do
    whatever you need to to make a cgi script executable on your system),
    and then update the paths at the bottom of this file to suit your site.

    This is probably the slowest way to serve django pages, as the python
    interpreter, the django code-base and your site code has to be loaded
    every time a request is served. FCGI and mod_python solve this problem, 
    use them if you can.

    In order to speed things up it may be worth experimenting with running
    uncompressed zips on the sys.path for django and the site code, as
    this can be (theorectically) faster. See PEP-0273 specifically Benchmarks.
    
    https://www.python.org/dev/peps/pep-0273/).
    
    Make sure all python files are compiled in your code base.  See
    
    https://docs.python.org/lib/module-compileall.html)
    
    import os, sys
    #insert a sys.path.append("whatever") in here if django is not
    #on your sys.path.
    sys.path.append("/home/psmi045/public_html/www2/django")
    sys.path.append("/home/psmi045/public_html/www2/psc")
    sys.path.append("/home/psmi045/public_html/www2")
    import django.core.handlers.wsgi
    def run_with_cgi(application):
        environ = dict(os.environ.items())
        environ["wsgi.input'] = sys.stdin
        environ["wsgi.errors'] = sys.stderr
        environ["wsgi.version'] = (1,0)
        environ["wsgi.multithread'] = False
        environ["wsgi.multiprocess'] = True
        environ["wsgi.run_once'] = True
        if environ.get("HTTPS',"off') in ("on',"1'):
            environ["wsgi.url_scheme'] = "https'
        else:
            environ["wsgi.url_scheme'] = "http'
    headers_set = []
    headers_sent = []

    def write(data):
        if not headers_set:
            raise AssertionError("write() before start_response()")
        elif not headers_sent:
    #Before the first output, send the stored headers
        status, response_headers = headers_sent[:] = headers_set
        sys.stdout.write("Status: srn' status)
        for header in response_headers:
            sys.stdout.write("%s: srn' header)
            sys.stdout.write("rn')
            sys.stdout.write(data)
            sys.stdout.flush()

    def start_response(status,response_headers,exc_info=None):
        if exc_info:
            try:
                if headers_sent:
                #Re-raise original exception if headers sent
                raise exc_info[0], exc_info[1], exc_info[2]
            finally:
                exc_info = None \#avoid dangling circular ref
        elif headers_set:
            raise AssertionError("Headers already set!")
            headers_set[:] = [status,response_headers]
            return write
        result = application(environ, start_response)
        try:
            for data in result:
                if data: \#don't send headers until body appears
                    write(data)
                if not headers_sent:
                    write(") \#send headers now if body was empty
        finally:
            if hasattr(result,"close'):
                result.close()
                #Change this to the directory above your site code.
                os.chdir("/home/psmi045/public_html/www2")
                #Change mysite to the name of your site package
                os.environ["<span class="caps">DJANGO_SETTINGS_MODULE</span>'] = "psc.settings"
                run_with_cgi(django.core.handlers.wsgi.WSGIHandler())

And that's pretty much it. The rest was a matter of following
Jeff's instructions. Well amost it. Alas, A2
Hosting has several versions of Python lying around and not all of
them have the necessary libraries; when I was using /usr/bin/python
the MySQLdb module wouldn't load. But that was fixed by moving to
/usr/local/bin/python.

