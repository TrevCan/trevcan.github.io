How do I fix this blogit?

hey there, I hope you are having a nice day.
Today was a much more intersting day than the rest of the week,
I got to actually deploy my [blog mirror](http://trevcan.duckdns.org/blog)
and it literally looks exactly like on github, exect that mime types
are not auto-completed like in github, e.g. i can type something like
```
http://trevcan.github.io/index
```
and it will be the same as 
```
http://trevcan.github.io/index.html
```
and so on. I guess there's some plugin in *nginx* that I can use or something.
Should also add https or something, although since I'm not hosting any 
arbitrary code, it is simply rendering html and css (no js folks!) it shouldn't
be a problem, right?

--------------------------------
Well, onto another random thing. There's a problem with 
[*blogit*](http://github.com/trevcan/blogit)
([mirror](http://trevcan.duckdns.org/git/blogit/log.html)
. See, the issue is that sometimes I deploy it and it works perfectly. The most 
recent article pops up at the top of the index html file but sometimes, more like
almost every time it stops working out of nowhere! Github and my computer and
my home server all react the same way as long as they were on the same commit/
working directory etc.... When this happens, **every article gets the same edit
date** which is nuts! And then for some weird reason the 404 article pops up
right at the top! [look!](https://archive.md/9Fn0i/image)

So yeah I'm not sure how I'll tackle this problem.  I was doing some light 
testing and I think when one of the build directories existen the commit date/
last edited date worked correctly and most recent articles were always at
the top. I guess I'll look into that.

Also, as you might have noticed, I now have a static html thingy showing
some git repos. the server works and everything and I'm using
[*duckdns.org*](http://duckdns.org) to serve my dynamic ip address
and use their free dns subdomain services and it works well enough and you can
have up to 5 subdomains.

so yeah, that's it. I'llprobably solve this problem right now maybe??

;tags: write en site-update

