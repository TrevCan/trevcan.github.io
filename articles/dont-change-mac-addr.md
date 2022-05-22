Changing your device's MAC address is risky.

At least that was certainly my experience with it.

I recently installed macchanger [[0]], a utility to... yes! change your mac address. 

A MAC address stands for _Media Access Control address_. It is a unique identifier address used for network interface controllers (NICs, according to Wikipedia). So your LAN controller and your WiFi controllers have MAC addresses. 

But companies and governments have standardized the way in which unique MAC addresses are set. I could, in theory, get into an insecure network and know how many devices are from X or why company. The FCC or some other organization assigns 'blocks' that companies can use in order to set these MAC addresses. I think MAC addresses are used in network routers (e.g. the one your ISP gives you) to keep track of who has this or that IP address. 

So as I sad in the beginning of this post, I tried changing my MAC address. 
Because as of now, I could connect to my network and possibly know that this or that device is or this or that brand. 
Which, in my opinion, is creepy as fuck. 
So why not be more privacy minded ? So yeah, I tried changing my MAC address to a random one.

So you run the command. Nothing happens, it says that you should try using the `--help` flag, so I do. There is a **random** flag, just what I need. I do it. It tells me that I'm missing something.
I read the manpage. 
You have to specify the network adapter. 
So I run `ip a`. 
my computer is connected through an ethernet cable. I get the adapter name. I put it at the end of my command. Now I get permission denied. Fair enough, just use `sudo !!`. and it works!
Now I have another MAC address. But guess what ? 

I go to sleep, I wake up the next day. I do not open my computer, do not check on it. The blog is fucked. I cannot sync anything. The server is inaccessible. Why ? Great question.

Then I try all kinds of stuff. I get to my house, I can access it from my Local Area Network. the IP address works. My public ports are fine. Then I remember, I changed the MAC address. Maybe I should restart my web server. That does not work. Neither does restarting the Network Manager.

I give up, I reset the MAC address to its default configuration. Maybe I cannot change the MAC address and **not reboot.**

So now it works with the default MAC address.


# references

- [0] macchanger on arch linux packages: <https://archlinux.org/packages/community/x86_64/macchanger/>
- [1] MAC address, _wikipedia_. 
<https://en.m.wikipedia.org/wiki/MAC_address>