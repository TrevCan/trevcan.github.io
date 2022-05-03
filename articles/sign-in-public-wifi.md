Getting access to public wifi internet on Linux

Okay, so you're at a mall or something, there's public
_WiFi_. Cool. And you can access the internet with your
phone. But you open your Linux computer and connect
to the network, yet nothing happens ! I'll show you
how to fix this.

Most public wifi networks use what is known as a 
**_Captive Portal_**. It is merely a login page used
to authenticate control over Wi-Fi hotspots (Nyman, 2013).

# tdlr

just go to <http://192.168.1.1> on a web browser. 
It should redirect
you to the login page.

# tldr 2

tldr didn't work ? Open a web browser, create an incognito window,
go to a website **you've never visited before**. It should
redirect you to the login page.

# tldr 3 

get into a terminal. type the following command: `ip route`.
you should get something like:

```
$ ip route
default via 192.168.1.1 dev zwn0 proto dhcp metric 600
172.17.0.0/16 dev docker0 proto kernel scope link src 172.17.0.1 linkdown
192.168.1.0/24 dev wlan0 proto kernel scope link src 192.168.1.68 metric 600
```

get the first IP address under _default_. In this case, `192.168.1.1`.
That should redirect you to the login page. If none of these
solutions work, you should try reading this [[0]](#references) stackoverflow
question. It has great explanations on what
could be going on, as well as multiple solutions.

# wut

if you're on a nice Desktop Environment (DE), the captive portal page
will most likely open for you just as you connect to the network.


# references

- [0]: How to sign into an open Wireless Network?. _unix.stackexchange.com_. 2013. <https://unix.stackexchange.com/q/89630/497507>
- Thomas, Nyman. 2013. Answer for _How to sign into an open Wireless Network ?_ 
<https://unix.stackexchange.com/a/89705/497507>
- Gite, Vivek. 2020. How Do I Find Out My Linux Gateway / Router IP Address?
<https://www.cyberciti.biz/faq/how-to-find-gateway-ip-address/>
  - because sometimes I don't RTFM.

