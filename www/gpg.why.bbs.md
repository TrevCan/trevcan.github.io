# Arch Linux Bulletin Board System Post
 
First of all, your help, any help would be greatly appreciated.
 
[h]
the problem
[/h]
I've been using the [https://passwordstore.org] program for quite a while now, about 9 months I'd say.
All was going well until about 4 weeks ago. I don't 
know what happened, what caused it or why. Pass started acting up, it took from
20 to 30 seconds what used to take literally 1 second. The pinentry-gtk-2 
program was taking a whole lot of time to start. So I dug deeper. Eventually I
found out that it definitely had something to do with GnuPG as decrypting
files directly through GnuPG also yielded the same results, after all, pass is
just a bash script that uses gpg encryption and decryption commands. So then I
went searching on the internets and it was pretty bad. I couldn't really find
any information regarding GnuPG besides [0]

I've tried almost* everything to get gpg up and running but it just, 
won't work! I don't know if this was a system upgrade or 
something but point is, it just slowed way down. When [b]requesting a password, [/b]
it'd take anywhere from 20 to 40 seconds to just show the pinentry binary (the 
one that asks you for the password), in particular, the `pinentry-gtk-2`, but 
guess what? I tried using the ncurses version also and it didn't work! I tried 
decrypting and encrypting files directly by using gpg, but yielded the same 
results!, also tried with the `pinentry-tty` binary.

I tried the stackexchange solution but it didn't work. Later on, 
I hopped onto libera IRC to join the `gnupg` channel, as 
suggested by members in the `pass` channel, as this is clearly much more 
specific to gpg. In the `gnupg` channel I had the fortune to be able to talk to 
someone to walk me through a ton of things. Testing, after testing and testing. 
We even tried creating less-resource intensive keys, creating temporary gnu 
directories to store keys in, et cetera.

[b]
Also, I should point out that the behaviour is not intermittent, [em] it is 
definitely constant. [/em]
I do have a password cache enabled, but every time time 
has passed or I manually clear the password cache (with [code] echo RELOADAGENT | gpg-connect-agent [/code] ) the same behaviour happens.
[/b]

[h]
System Information
[/h]

[em]Arch Linux. Hardware: T490. 16 GB RAM, 500 GB SSD. Intel core i7 8th gen.
[/em]

[code]
$ uname --all
Linux t490-4rch 5.14.9-zen2-1-zen #1 ZEN SMP PREEMPT Fri, 01 Oct 2021 19:03:23 +0000 x86_64 GNU/Linux
[/code]


[h]
logs
[/h]

[code]
strace pass show Test/random > strace.pass.show.test.random.out 2>&1
[/code]
[url=https://gist.githubusercontent.com/TrevCan/27b969d478c69699f33df65d8cac4ff8/raw/c39cb3b3c713a5ebeddc18f3e7ef144601645733/gpgagent.debug.out] Log: gpg debug with strace [/url]


[quote=unixbhaskar]
Well, add these lines in your gpg-agent.conf file and tail the log file on another window see live what is going on :
	[code]
	log-file /path/to/your/gpg-agent.log
	debug-pinentry
	debug ipc
	verbose
	[/code]
[/quote]

[code]
$ cat ~/.gnupg/gpg-agent.conf
# max-cache-ttl 39696
# pinentry-program /usr/bin/pinentry-curses
pinentry-program /usr/bin/pinentry-tty

log-file /home/trevorlarbs/.gnupg/gpg-agent.debug.log
debug-pinentry
debug ipc
verbose
[/code]

[code]
$ tail -f .gnupg/gpg-agent.debug.log > gpgagent.debug.out
[/code]

[url=https://gist.githubusercontent.com/TrevCan/27b969d478c69699f33df65d8cac4ff8/raw/c39cb3b3c713a5ebeddc18f3e7ef144601645733/gpgagent.debug.out] Log: gpgagent.debug.out [/url]

[h] What I've done so far
[/h]
[list]
[*]
	i've tried with normal linux kernel, linux-lts, and linux-zen. Same behaviour for all three.
[/*]
[*]
	live Booting of usb with iso: [b]behaviour does change, it asks for password instantly.[/b]
[/*]
[*]
	tried with other WM / DEs. dwm (larbs, default), KDE, xfce4. same behaviour in all.
[/*]
[*]
	tried creating a temporary directory with new gpg keys, even with less resource intensive algorithms. Did not work, still took a lot of time.
[/*]


[/list]


[b]references
[/b]


[list]
[*]

[url=https://unix.stackexchange.com/questions/628092/why-would-gpg-pinentry-be-slow-when-opening-in-gui-but-instantaneous-when-openin] 0. Why would GPG Pinentry be slow when opening in GUI but instantaneous when opening in CLI? [/url]
[/*]
[*]
[url=https://old.reddit.com/r/GPGpractice/comments/q26tsf/pinentry_slows_down_all_of_a_sudden/?ref=share&ref_source=link] 1. pinentry slows down all of a sudden. r/GPGPractice. Posted by me. [/url]
[/*]
[*]
[url=https://trevcan.github.io/neofetch.html] 2. neofetch [/url]
[/*]
[*]
[url=https://old.reddit.com/r/GnuPG/comments/q2apuh/pinentry_takes_about_30_seconds_to_launch/] 3. pinentry takes about 30 seconds to launch. r/GnuPG. Posted by me. [/url]
[/*]


[/list]


