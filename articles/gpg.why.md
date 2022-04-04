Why is GnuPG / GPG  acting up ? 

After trying several things to fix encryption and decryption in GnuPG I have no 
real hopes. I honestly don't know what to do but to keep asking. I've searched on 
stackoverflow for pinentry and gpg-agent acting up and taking too much time and 
I only found one stack overflow question [\[0\]](#references) which didn't get
that close to my issue.
It slows down when using the pinentry-curses, pinentry-gtk-2 binaries.

edit: I found out the problem! Thanks to [u/xXbobby123Xx](https://www.reddit.com/r/GnuPG/comments/q2apuh/comment/hpa3m6f/?utm_source=share&utm_medium=web2x&context=3) for discovering the solution,
and this GNU forum: [https://dev.gnupg.org/T3240](https://dev.gnupg.org/T3240) it appears to be a bug in gnome-keyring.

**Uninstalling the gnome-keyring is the solution for now.**

there appear to be 2 dev.gnupg.org forum posts:
- https://dev.gnupg.org/T3240
- https://dev.gnupg.org/T4592 (this url is kinda broken but didn't use to be)

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
any information regarding GnuPG acting up except for [\[0\]](#references), 
which 

### reddit post
[source: \[1\]](#references)

First of all, your help, any help would be greatly appreciated.

*Maybe this will be Unix/Linux specific, i don't really know.*

Hello. I've tried almost* everything to get gpg up and running but it just, 
won't work! So, storytime. Almost after I went full linux I stumbled upon 
[pass](http://passwordstore.org), a great tool to manage passwords in a 
convenient way. I've been using it for around 8-9 months. And it's worked like 
a charm, until about 3 weeks ago. I don't know if this was a system upgrade or 
something but point is, it just slowed way down. When requesting a password, 
it'd take anywhere from 20 to 40 seconds to just show the pinentry binary (the 
one that asks you for the password), in particular, the `pinentry-gtk-2`, but 
guess what? I tried using the ncurses version also and it didn't work! I tried 
decrypting and encrypting files directly by using gpg, but yielded the same 
results!, cause after all, `pass` is just a bash script that uses gpg commands 
for encryption and decryption. So, yeah. After that, I tried searching on the 
internets, but didn't stumble upon anything at all except for 
[this](https://unix.stackexchange.com/questions/628092/why-would-gpg-pinentry-be
-slow-when-opening-in-gui-but-instantaneous-when-openin) which didn't seem to 
solve the problem, as my problem happened with all `pinentry*` binaries (yes, 
even `pinentry-tty` !!). I tried the solution but it didn't work. Later on, 
actually yesterday, I hopped onto libera IRC to join the `gnupg` channel, as 
suggested by members in the `pass` channel, as this is clearly much more 
specific to gpg. In the `gnupg` channel I had the fortune to be able to talk to 
someone to walk me through a ton of things. Testing, after testing and testing. 
We even tried creating less-resource intensive keys, creating temporary gnu 
directories to store keys in, et cetera. I'm documenting most (if not all, ) 
this info at [this website](https://trevcan.github.io/gpg.why) .

**Also, I should point out that the behaviour is not intermittent, _it is 
definitely constant_. I do have a password cache enabled, but every time time 
has passed or I manually clear the password cache (with `echo RELOADAGENT | 
gpg-connect-agent` and then `gpgconf --kill all`) the same behaviour happens.**

I haven't tried this yet, but maybe later in the day I'll try booting off a 
linux arch iso and trying to install gpg and checking if it's my laptop or 
something...

*maybe i will reinstall arch linux

edit: add behaviour

## system
Arch Linux. Hardware: T490. 16 GB RAM, 500 GB SSD. Intel core i7 8th gen.

neofetch [\[2\]](#references)

```
$ uname --all
Linux t490-4rch 5.14.9-zen2-1-zen #1 ZEN SMP PREEMPT Fri, 01 Oct 2021 19:03:23 +0000 x86_64 GNU/Linux
```

## logs

`strace pass show Test/random > strace.pass.show.test.random.out 2>&1`


# todo
- try with other linux kernels (current one is zen)
- boot off a live arch iso and test there... 
- idk

# inprogress
- try with other kernels:
	- linux-lts, linux

# done
- yes i've tried with normal lunux kernel and linux-lts and linux-zen. . same behaviour for both.
- live boot off iso: yes, there os a change, just does it instantly lol, which rules out hardware !! yayyyy.

### references
- P.S.: hyperlinks open in new tab
- [\[0\] Why would GPG Pinentry be slow when opening in GUI but instantaneous 
when opening in 
CLI?](https://unix.stackexchange.com/questions/628092/why-would-gpg-pinentry-be-slow-when-opening-in-gui-but-instantaneous-when-openin)
- [\[1\] pinentry slows down all of a sudden. old.reddit.com](https://old.reddit.com/r/GPGpractice/comments/q26tsf/pinentry_slows_down_all_of_a_sudden/?ref=share&ref_source=link)
- [\[2\] neofetch ](neofetch.html)
	

- [understanding Apple's binary propert lists files](https://medium.com/@karaiskc/understanding-apples-binary-property-list-format-281e6da00dbd)
	
	
	
