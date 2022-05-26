Lazy man's VPN or <em>Simple VPN through SSH</em>

It works like a VPN, acts like a VPN, feels like a VPN; but it kinda
isn't a VPN.

Would you like to access your local network ? 

Are you too lazy to set up a real VPN server like me ? Do
you like security ? Well, now you can use a virtual private
network through ssh and route all requests from one machine to
another, using [sshuttle](https://github.com/sshuttle/sshuttle).

# tldr
commands:

```
sshuttle -x server.org -r user@server.org 0.0.0.0/0 --dns
sshuttle -x server.org -r user@server.org addresses/subnet --dns
```

WHERE:

`server.org` is your (ssh-enabled) server's domain name.

`-x server.org` means, exclude the `server.org` domain from being routed 
through your server (`server.org`), the wiki says some problems occur on some
linux machines - it will recursively resolve to itself and the ssh session 
will crash.

use `0.0.0.0` on `SUBNET` to route ALL requests through ssh server.

use `24` for `subnet` and use `192.168.1.0` on `addresses` to route requests starting with `192.168.1.` through the ssh server.

e.g. `sshuttle --dns -x thetrevor.tech -r trevor@thetrevor.tech 192.168.1.0/24`

# references 

- Sshuttle wiki: <https://sshuttle.readthedocs.io/en/latest/usage.html>
- 

;tags: vpn ssh security short linux
