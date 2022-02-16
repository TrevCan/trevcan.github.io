Setting up Cloudflare's DNS

A DNS stands for Domain Name System.
It is simply a protocol for getting the IP address of any given domain name.

Usually, your Internet Service Provider (aka ISP) will provide you with one which may be a little slow,
or even may block certain websites.

Below is a guide on how to set your DNS to Cloudflare. Any of these
configurations can be (in theory) applied to all your network, but if you want there's nothing stopping you from doing this for a single device (just search "how to set up DNS \[device name])

DNS Cloudflare

[https://1.1.1.1](https://1.1.1.1)

1. For IPv4, replace the existing addresses with:   - 1.1.1.1   - 1.0.0.1 
2. For IPv6, replace the existing addresses with:
 2606:4700:4700::1111  2606:4700:4700::1001


# references
https://developers.cloudflare.com/1.1.1.1/setup-1.1.1.1/router
