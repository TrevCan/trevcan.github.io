Git server upgrade!

So, as of yesterday I was running a git over ssh server.
Which isn't even a server *per se*, since it just runs
software that was already installed on my system.

But this approach isn't very useful. It does not allow
me to update my git repositories (including
my blog) through restricted networks, such
as the institution I study at. Port 22 is indeed
restricted.

So I though, I've always seen that https/ssh/zip button
link thing on github. Why can't I do that ? Isn't https
like allowed on almost any network ? So I started investigating.

According to the git-scm reference manual, there are other 
ways to host servers. One of them is using a CGI script that
runs server-side.

So I tried to set up my lighttpd web server to route all requests
for the domain `https://git-push.thetrevor.tech/` to the CGI script.

I must say, this was a pain in the ass, but this is my working configuration
file.

[https://git-trevcan.duckdns.org/lighttpd-conf.git/tree/sites-enabled/push-git.conf](https://git-trevcan.duckdns.org/lighttpd-conf.git/tree/sites-enabled/push-git.conf)

when i have the time i'll explain it over.

;tags: git technical linux https
