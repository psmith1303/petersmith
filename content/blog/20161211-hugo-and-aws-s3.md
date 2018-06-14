+++
draft = "False"
date = "2016-12-11T12:53:55+13:00"
title = "Hugo and AWS/S3"
categories = [
  "Blogging",
  "IT",
]
slug = "hugo-and-aws-s3"

+++

This site, and a few others I have, are built
using [Hugo](https://gohugo.io/). Until today, I have been hosting the
sites on a spare [Raspberry Pi](https://www.raspberrypi.org/) I had
lying around at home. That is all well and good, but I think I want
something more robust.

So today, I have moved the site to AWS using S3. There are a lot of
tutorials/guides on how to do this, and here is my summary.

1. Set up a bucket on S3. The name should be the same name as the
   site; e.g. in this case it it `petersmith.org`
2. On S3, configure the bucket to be a static website, and set-up the
   *Index Document* to be `index.html` and the *Error Document* to be
   `404.html` (or what ever matches your configuration
3. Copy your local site (typically in the public directory of your
   hugo installation) to S3. I use ` s3cmd put -P --recursive
   public/ s3://petersmith.org`
4. Change your DNS to point to the S3 bucket. Specifically, set a
   CNAME record to point to the S3 bucket. The bucket will have a name
   something like `petersmith.org.s3-website-us-west-2.amazonaws.com`.

Then you are done.

If you want to have https on your site, then that is another story.
You will still set up S3, but then you also need to set up CloudFront.
That is something for another day.


### Ooops no mail

I did a bad bad thing and my email stopped working. If you point your
naked domain (in my case petersmith.org) to AWS, it effectively masks
the MX records in the DNS, and so mail stops working.

The right thing to do is:

1. Set up a bucket with a name like `www.petersmith.org` and put all the content there.
2. On your DNS set up a CNAME record for www pointing to the new S3
   bucket; i.e., `petersmith.org.s3-website-us-west-2.amazonaws.com`
3. Set a A record on the DNS to point to `174.129.25.170` at
   (wwwizer)[http://wwwizer.com/]. It's not their main business but it
   works.


