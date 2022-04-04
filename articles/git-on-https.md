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

According to the git-scm [0] reference manual, there are other 
ways to host servers. One of them is using a CGI script that
runs server-side.

So I tried to set up my lighttpd web server to route all requests
for the domain `https://git-push.thetrevor.tech/` to the CGI script.

I must say, this was a pain in the ass, but this is my working configuration
file.

[https://git-trevcan.duckdns.org/lighttpd-conf.git/tree/sites-enabled/push-git.conf](https://git-trevcan.duckdns.org/lighttpd-conf.git/tree/sites-enabled/push-git.conf)

when i have the time i'll explain it over.

### references

- [[0]](https://git-scm.com/book/en/v2/Git-on-the-Server-Smart-HTTP) git on the server: smart http.
- [info on cgi scripts](https://en.wikipedia.org/wiki/Common_Gateway_Interface)


### lighttpd useful links

- [URL Rewrite mod_rewrite](https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ModAuth)
- [stackoverflow handle cgi c executables](https://stackoverflow.com/questions/6267084/configuring-lighttpd-to-handle-cgi-c-executables)
### public inbox .org ?
- [https://public-inbox.org/](https://public-inbox.org/)

### the wisconsin shell
- [https://github.com/Saggarwal9/MyWisconsinShell](https://github.com/Saggarwal9/MyWisconsinShell)

;tags: git technical linux https
