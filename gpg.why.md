# Why is GnuPG acting up ? 

After trying several things to fix encryption and decryption in GnuPG I have no 
real hopes. I honestly don't know what to do but to keep asking. I've search on 
stackoverflow for pinentry and gpg-agent acting up and taking too much time and 
I only found one stack overflow question [\[0\]](#references) which didn't get
that close to my issue.
It slows down when using the pinentry-curses and pinentry-gtk-2 binaries.

# the problem
I've been using the [https://passwordstore.org] program for quite a while now,
about 8 months I'd say. All was going well until about 3 weeks ago. I don't 
know what happened, what caused it or why. Pass started acting up, it took from
20 to 30 seconds what used to take literally 1 second. The pinentry-gtk-2 
program was taking a whole lot of time to start. So I dug deeper. Eventually I
found out that it definitely had something to do with GnuPG as decrypting
files directly through GnuPG also yielded the same results, after all, pass is
just a bash script that uses gpg encryption and decryption commands. So then I
went searching on the internets and it was pretty bad. I couldn't really find
any information regarding GnuPG acting up except for [\[0\]](#references), which 


### references
- P.S.: hyperlinks open in new tab
- [\[0\] Why would GPG Pinentry be slow when opening in GUI but instantaneous when opening in CLI?](https://unix.stackexchange.com/questions/628092/why-would-gpg-pinentry-be-slow-when-opening-in-gui-but-instantaneous-when-openin){:target="_blank"}






