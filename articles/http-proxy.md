HTTP Proxy

I have a problem. I'm a linux junkie. I'd like to ssh into my 
home-server from any network. This means networks that don't allow
port 22. My institution's network only allows port 80 and 443 (and
maybe vpn ports).

So I think what I need is a proxy server. A proxy is what is sounds 
like. It's an intermediary between me and the target server. But
it can work through http and use other protocols (in theory).

## useful links

- [tunneling http thru ssh](http://travisaltman.com/tunneling-http-thru-ssh/)
- [proxy server. *wikipedia*](https://en.wikipedia.org/wiki/Proxy_server)
- [lighttpd modsock proxy](https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ModSockProxy)
- [docs mod proxy](https://redmine.lighttpd.net/projects/lighttpd/wiki/Docs_ModProxy)
- [lighttpd reverse proxy](https://stackoverflow.com/questions/48794514/lighttpd-reverse-proxy#48970712)
- [lighttpd as reverse proxy](https://stackoverflow.com/questions/4859956/lighttpd-as-reverse-proxy)
- 

- [corkscrew.](https://github.com/bryanpkc/corkscrew)
- [guide: using corkscrew to tunnel ssh inside https](https://www.techrepublic.com/article/using-corkscrew-to-tunnel-ssh-over-http/)
- [guide: http thru ssh ](http://travisaltman.com/tunneling-http-thru-ssh/)
- [apache mod_proxy](https://httpd.apache.org/docs/2.4/mod/mod_proxy.html)
- 


**I tried doing some of these but was, unfortunately,**
**unsuccessful.**

Maybe if I try this with an apache web server it might work,
but who knows !?

;tags: technical 
