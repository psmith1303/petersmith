+++
date = "2017-05-25T11:40:39+12:00"
title = "CourseGuide.Info"
categories = [
  "Teaching",
  "IT",
  "BUSINESS705",
]
slug = "courseguide-info"
draft = "False"

+++

I am at the stage with the (re)development of BUSINESS 705, that I want to start assembling things from a users' (students') perspective.

To that end, I have decided to set up a website, "[CourseGuide.Info](https://CourseGuide.Info/)".

I followed the AWS guide to hosting a static website on S3 (Note to self; the S3 bucket is at courseguide.info.s3-website-us-west-2.amazonaws.com, but I have done the necessary stuff to link the domain name to the bucket). So students simply need to type in **courseguide.info**. 

Well that's not strictly true. I did do a few things different to the guide.

1. I created a bucket called www.courseguide.info
2. I set the appropriate policies etc, as described in the AWS guide.
3. I did the [redirection of the www](https://www.petersmith.org/2016/12/11/hugo-and-aws-s3/) to the
   bare domain name using DNS records (rather than magic at the AWS
   end).

I went with a rather generic domain name, so that, if needed in
future, I can add the content for other courses there. I.e., I will
really use http://courseguide.info/business705/ for this course.

I plan to use [bookdown](https://bookdown.org/yihui/bookdown/) to
stucture the data; that way I can deliver it either as a website, a
PDF document, or as an e-book.


