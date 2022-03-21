Simple VPN through SSH

Would you like to access your local network ? 

Are you too lazy to set up a real VPN server like me ? Do
you like security ? Well, now you can use a virtual private
network through ssh and route all requests from one machine through
another, using [sshuttle](https://github.com/sshuttle/sshuttle).

commands:

```
sshuttle -r user@server.org 0.0.0.0/0 --dns
sshuttle -r user@server.org SUBNET/0 --dns
```

use 0.0.0.0 on SUBNET to route ALL requests through ssh server.

use 192.168.1.0 on SUBNET to route requests starting with 192.168.1. through the ssh server.

;tags: vpn ssh sec short
