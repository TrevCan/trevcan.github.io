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

<details>
<summary>strace.pass.show.test.random.out</summary>
<p>

```
execve("/usr/bin/pass", ["pass", "show", "Test/random"], 0x7fff3e1d4b70 /* 76 vars */) = 0
brk(NULL)                               = 0x558eb6da0000
arch_prctl(0x3001 /* ARCH_??? */, 0x7ffd4cc5d910) = -1 EINVAL (Invalid argument)
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=266076, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 266076, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f1b4e9a5000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`|\2\0\0\0\0\0"..., 832) = 832
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
pread64(3, "\4\0\0\0@\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0"..., 80, 848) = 80
pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0K@g7\5w\10\300\344\306B4Zp<G"..., 68, 928) = 68
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=2150424, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f1b4e9a3000
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
mmap(NULL, 1880536, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f1b4e7d7000
mmap(0x7f1b4e7fd000, 1355776, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x26000) = 0x7f1b4e7fd000
mmap(0x7f1b4e948000, 311296, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x171000) = 0x7f1b4e948000
mmap(0x7f1b4e994000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1bc000) = 0x7f1b4e994000
mmap(0x7f1b4e99a000, 33240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f1b4e99a000
close(3)                                = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f1b4e7d5000
arch_prctl(ARCH_SET_FS, 0x7f1b4e9a4600) = 0
mprotect(0x7f1b4e994000, 12288, PROT_READ) = 0
mprotect(0x558eb621e000, 4096, PROT_READ) = 0
mprotect(0x7f1b4ea14000, 8192, PROT_READ) = 0
munmap(0x7f1b4e9a5000, 266076)          = 0
brk(NULL)                               = 0x558eb6da0000
brk(0x558eb6dc1000)                     = 0x558eb6dc1000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=6305936, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 6305936, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f1b4e1d1000
close(3)                                = 0
execve("/home/trevorlarbs/.local/share/cargo/bin/bash", ["bash", "/usr/bin/pass", "show", "Test/random"], 0x7ffd4cc5dab8 /* 76 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/local/sbin/bash", ["bash", "/usr/bin/pass", "show", "Test/random"], 0x7ffd4cc5dab8 /* 76 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/local/bin/bash", ["bash", "/usr/bin/pass", "show", "Test/random"], 0x7ffd4cc5dab8 /* 76 vars */) = -1 ENOENT (No such file or directory)
execve("/usr/bin/bash", ["bash", "/usr/bin/pass", "show", "Test/random"], 0x7ffd4cc5dab8 /* 76 vars */) = 0
brk(NULL)                               = 0x556c86081000
arch_prctl(0x3001 /* ARCH_??? */, 0x7ffd405ca790) = -1 EINVAL (Invalid argument)
access("/etc/ld.so.preload", R_OK)      = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) = 3
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=266076, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 266076, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f04230bb000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libreadline.so.8", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 p\1\0\0\0\0\0"..., 832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=342848, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f04230b9000
mmap(NULL, 350856, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f0423063000
mmap(0x7f042307a000, 176128, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17000) = 0x7f042307a000
mmap(0x7f04230a5000, 40960, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x42000) = 0x7f04230a5000
mmap(0x7f04230af000, 36864, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4b000) = 0x7f04230af000
mmap(0x7f04230b8000, 2696, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f04230b8000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libdl.so.2", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0000\"\0\0\0\0\0\0"..., 832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=22704, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 24720, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f042305c000
mmap(0x7f042305e000, 8192, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) = 0x7f042305e000
mmap(0x7f0423060000, 4096, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f0423060000
mmap(0x7f0423061000, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x4000) = 0x7f0423061000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libc.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`|\2\0\0\0\0\0"..., 832) = 832
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
pread64(3, "\4\0\0\0@\0\0\0\5\0\0\0GNU\0\2\0\0\300\4\0\0\0\3\0\0\0\0\0\0\0"..., 80, 848) = 80
pread64(3, "\4\0\0\0\24\0\0\0\3\0\0\0GNU\0K@g7\5w\10\300\344\306B4Zp<G"..., 68, 928) = 68
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=2150424, ...}, AT_EMPTY_PATH) = 0
pread64(3, "\6\0\0\0\4\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0@\0\0\0\0\0\0\0"..., 784, 64) = 784
mmap(NULL, 1880536, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f0422e90000
mmap(0x7f0422eb6000, 1355776, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x26000) = 0x7f0422eb6000
mmap(0x7f0423001000, 311296, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x171000) = 0x7f0423001000
mmap(0x7f042304d000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1bc000) = 0x7f042304d000
mmap(0x7f0423053000, 33240, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) = 0x7f0423053000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/libncursesw.so.6", O_RDONLY|O_CLOEXEC) = 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0 p\1\0\0\0\0\0"..., 832) = 832
newfstatat(3, "", {st_mode=S_IFREG|0755, st_size=453688, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 457976, PROT_READ, MAP_PRIVATE|MAP_DENYWRITE, 3, 0) = 0x7f0422e20000
mmap(0x7f0422e37000, 241664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x17000) = 0x7f0422e37000
mmap(0x7f0422e72000, 98304, PROT_READ, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x52000) = 0x7f0422e72000
mmap(0x7f0422e8a000, 24576, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x69000) = 0x7f0422e8a000
close(3)                                = 0
mmap(NULL, 8192, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1, 0) = 0x7f0422e1e000
arch_prctl(ARCH_SET_FS, 0x7f0422e1eb80) = 0
mprotect(0x7f042304d000, 12288, PROT_READ) = 0
mprotect(0x7f0422e8a000, 20480, PROT_READ) = 0
mprotect(0x7f0423061000, 4096, PROT_READ) = 0
mprotect(0x7f04230af000, 12288, PROT_READ) = 0
mprotect(0x556c843de000, 12288, PROT_READ) = 0
mprotect(0x7f042312a000, 8192, PROT_READ) = 0
munmap(0x7f04230bb000, 266076)          = 0
openat(AT_FDCWD, "/dev/tty", O_RDWR|O_NONBLOCK) = 3
close(3)                                = 0
brk(NULL)                               = 0x556c86081000
brk(0x556c860a2000)                     = 0x556c860a2000
openat(AT_FDCWD, "/usr/lib/locale/locale-archive", O_RDONLY|O_CLOEXEC) = 3
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=6305936, ...}, AT_EMPTY_PATH) = 0
mmap(NULL, 6305936, PROT_READ, MAP_PRIVATE, 3, 0) = 0x7f042281a000
close(3)                                = 0
openat(AT_FDCWD, "/usr/lib/gconv/gconv-modules.cache", O_RDONLY) = -1 ENOENT (No such file or directory)
openat(AT_FDCWD, "/usr/lib/gconv/gconv-modules", O_RDONLY|O_CLOEXEC) = 3
newfstatat(3, "", {st_mode=S_IFREG|0644, st_size=56353, ...}, AT_EMPTY_PATH) = 0
read(3, "# GNU libc iconv configuration.\n"..., 4096) = 4096
read(3, "B1002//\tJUS_I.B1.002//\nmodule\tJU"..., 4096) = 4096
read(3, "\tISO-IR-110//\t\tISO-8859-4//\nalia"..., 4096) = 4096
read(3, "\t\t\tISO-8859-14//\nalias\tISO_8859-"..., 4096) = 4096
read(3, "DIC-ES//\nalias\tEBCDICES//\t\tEBCDI"..., 4096) = 4096
read(3, "CDIC-CP-ES//\t\tIBM284//\nalias\tCSI"..., 4096) = 4096
read(3, "\t\tIBM863//\nalias\tOSF1002035F//\t\t"..., 4096) = 4096
read(3, "937//\t\tIBM937//\nmodule\tIBM937//\t"..., 4096) = 4096
read(3, "UJIS//\t\t\tEUC-JP//\nmodule\tEUC-JP/"..., 4096) = 4096
read(3, "lias\tISO2022CN//\t\tISO-2022-CN//\n"..., 4096) = 4096
read(3, "O_5427-EXT//\nalias\tISO_5427EXT//"..., 4096) = 4096
read(3, "ost\nmodule\tMAC-SAMI//\t\tINTERNAL\t"..., 4096) = 4096
read(3, "112//\t\tINTERNAL\t\tIBM1112\t\t1\nmodu"..., 4096) = 4096
brk(0x556c860c3000)                     = 0x556c860c3000
read(3, "s\tCP9448//\t\tIBM9448//\nalias\tCSIB"..., 4096) = 3105
read(3, "", 4096)                       = 0
close(3)                                = 0
getuid()                                = 1001
getgid()                                = 998
geteuid()                               = 1001
getegid()                               = 998
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
ioctl(-1, TIOCGPGRP, 0x7ffd405ca684)    = -1 EBADF (Bad file descriptor)
sysinfo({uptime=20057, loads=[40896, 36032, 26112], totalram=16418263040, freeram=11012460544, sharedram=480706560, bufferram=262111232, totalswap=12884897792, freeswap=12884897792, procs=1201, totalhigh=0, freehigh=0, mem_unit=1}) = 0
rt_sigaction(SIGCHLD, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGCHLD, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGTSTP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTSTP, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGTTIN, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTTIN, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGTTOU, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=0}, 8) = 0
rt_sigaction(SIGTTOU, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigaction(SIGQUIT, {sa_handler=SIG_IGN, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
uname({sysname="Linux", nodename="t490-4rch", ...}) = 0
newfstatat(AT_FDCWD, "/home/trevorlarbs", {st_mode=S_IFDIR|0700, st_size=4096, ...}, 0) = 0
newfstatat(AT_FDCWD, ".", {st_mode=S_IFDIR|0700, st_size=4096, ...}, 0) = 0
newfstatat(AT_FDCWD, "/home", {st_mode=S_IFDIR|0755, st_size=4096, ...}, 0) = 0
newfstatat(AT_FDCWD, "/home/trevorlarbs", {st_mode=S_IFDIR|0700, st_size=4096, ...}, 0) = 0
newfstatat(AT_FDCWD, "/home/trevorlarbs", {st_mode=S_IFDIR|0700, st_size=4096, ...}, 0) = 0
getpid()                                = 249168
getppid()                               = 249165
newfstatat(AT_FDCWD, ".", {st_mode=S_IFDIR|0700, st_size=4096, ...}, 0) = 0
newfstatat(AT_FDCWD, "/home/trevorlarbs/.local/share/cargo/bin/bash", 0x7ffd405ca2d0, 0) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/local/sbin/bash", 0x7ffd405ca2d0, 0) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/local/bin/bash", 0x7ffd405ca2d0, 0) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/bash", {st_mode=S_IFREG|0755, st_size=952720, ...}, 0) = 0
newfstatat(AT_FDCWD, "/usr/bin/bash", {st_mode=S_IFREG|0755, st_size=952720, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/bash", X_OK)           = 0
newfstatat(AT_FDCWD, "/usr/bin/bash", {st_mode=S_IFREG|0755, st_size=952720, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/bash", R_OK)           = 0
newfstatat(AT_FDCWD, "/usr/bin/bash", {st_mode=S_IFREG|0755, st_size=952720, ...}, 0) = 0
newfstatat(AT_FDCWD, "/usr/bin/bash", {st_mode=S_IFREG|0755, st_size=952720, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/bash", X_OK)           = 0
newfstatat(AT_FDCWD, "/usr/bin/bash", {st_mode=S_IFREG|0755, st_size=952720, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/bash", R_OK)           = 0
getpid()                                = 249168
getppid()                               = 249165
getpid()                                = 249168
getppid()                               = 249165
getpgrp()                               = 249165
ioctl(2, TIOCGPGRP, 0x7ffd405ca544)     = -1 ENOTTY (Inappropriate ioctl for device)
rt_sigaction(SIGCHLD, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, 8) = 0
ioctl(2, TIOCGPGRP, 0x7ffd405ca524)     = -1 ENOTTY (Inappropriate ioctl for device)
prlimit64(0, RLIMIT_NPROC, NULL, {rlim_cur=62572, rlim_max=62572}) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
openat(AT_FDCWD, "/usr/bin/pass", O_RDONLY) = 3
newfstatat(AT_FDCWD, "/usr/bin/pass", {st_mode=S_IFREG|0755, st_size=25808, ...}, 0) = 0
ioctl(3, TCGETS, 0x7ffd405ca610)        = -1 ENOTTY (Inappropriate ioctl for device)
lseek(3, 0, SEEK_CUR)                   = 0
read(3, "#!/usr/bin/env bash\n# set -x\n\n# "..., 80) = 80
lseek(3, 0, SEEK_SET)                   = 0
prlimit64(0, RLIMIT_NOFILE, NULL, {rlim_cur=1024, rlim_max=512*1024}) = 0
fcntl(255, F_GETFD)                     = -1 EBADF (Bad file descriptor)
dup2(3, 255)                            = 255
close(3)                                = 0
fcntl(255, F_SETFD, FD_CLOEXEC)         = 0
fcntl(255, F_GETFL)                     = 0x8000 (flags O_RDONLY|O_LARGEFILE)
newfstatat(255, "", {st_mode=S_IFREG|0755, st_size=25808, ...}, AT_EMPTY_PATH) = 0
lseek(255, 0, SEEK_CUR)                 = 0
read(255, "#!/usr/bin/env bash\n# set -x\n\n# "..., 8192) = 8192
umask(077)                              = 022
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
pipe([3, 4])                            = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], [], 8) = 0
lseek(255, -7782, SEEK_CUR)             = 410
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f0422e1ee50) = 249169
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGCHLD, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, 8) = 0
close(4)                                = 0
rt_sigprocmask(SIG_BLOCK, [INT], [], 8) = 0
read(3, "/dev/pts/0\n", 512)            = 11
read(3, "", 512)                        = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=249169, si_uid=1001, si_status=0, si_utime=0, si_stime=0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WNOHANG, NULL) = 249169
wait4(-1, 0x7ffd405c9390, WNOHANG, NULL) = -1 ECHILD (No child processes)
rt_sigreturn({mask=[INT]})              = 0
close(3)                                = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
read(255, "which gpg2 &>/dev/null && GPG=\"g"..., 8192) = 8192
newfstatat(AT_FDCWD, ".", {st_mode=S_IFDIR|0700, st_size=4096, ...}, 0) = 0
newfstatat(AT_FDCWD, "/home/trevorlarbs/.local/share/cargo/bin/which", 0x7ffd405ca120, 0) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/local/sbin/which", 0x7ffd405ca120, 0) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/local/bin/which", 0x7ffd405ca120, 0) = -1 ENOENT (No such file or directory)
newfstatat(AT_FDCWD, "/usr/bin/which", {st_mode=S_IFREG|0755, st_size=31280, ...}, 0) = 0
newfstatat(AT_FDCWD, "/usr/bin/which", {st_mode=S_IFREG|0755, st_size=31280, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/which", X_OK)          = 0
newfstatat(AT_FDCWD, "/usr/bin/which", {st_mode=S_IFREG|0755, st_size=31280, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/which", R_OK)          = 0
newfstatat(AT_FDCWD, "/usr/bin/which", {st_mode=S_IFREG|0755, st_size=31280, ...}, 0) = 0
newfstatat(AT_FDCWD, "/usr/bin/which", {st_mode=S_IFREG|0755, st_size=31280, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/which", X_OK)          = 0
newfstatat(AT_FDCWD, "/usr/bin/which", {st_mode=S_IFREG|0755, st_size=31280, ...}, 0) = 0
geteuid()                               = 1001
getegid()                               = 998
getuid()                                = 1001
getgid()                                = 998
access("/usr/bin/which", R_OK)          = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], [], 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [INT TERM CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [INT TERM CHLD], NULL, 8) = 0
lseek(255, -8155, SEEK_CUR)             = 447
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f0422e1ee50) = 249171
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 249171
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
ioctl(2, TIOCGWINSZ, 0x7ffd405ca250)    = -1 ENOTTY (Inappropriate ioctl for device)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=249171, si_uid=1001, si_status=0, si_utime=0, si_stime=0} ---
wait4(-1, 0x7ffd405c9ad0, WNOHANG, NULL) = -1 ECHILD (No child processes)
rt_sigreturn({mask=[]})                 = 0
read(255, "[[ -n $GPG_AGENT_INFO || $GPG =="..., 8192) = 8192
brk(0x556c860e4000)                     = 0x556c860e4000
brk(0x556c86105000)                     = 0x556c86105000
read(255, "at <<-_EOF\n\t===================="..., 8192) = 8192
read(255, "CIPIENT_ARGS[@]}\" -o \"$passfile\""..., 8192) = 8192
brk(0x556c86126000)                     = 0x556c86126000
brk(0x556c86147000)                     = 0x556c86147000
read(255, "tension && -x $system_extension "..., 8192) = 785
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
pipe([3, 4])                            = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], [], 8) = 0
lseek(255, -7, SEEK_CUR)                = 25801
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f0422e1ee50) = 249172
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGCHLD, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, 8) = 0
close(4)                                = 0
rt_sigprocmask(SIG_BLOCK, [INT], [], 8) = 0
read(3, " -- 'Test/random'\n", 512)     = 18
read(3, "", 512)                        = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=249172, si_uid=1001, si_status=0, si_utime=0, si_stime=0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WNOHANG, NULL) = 249172
wait4(-1, 0x7ffd405c8250, WNOHANG, NULL) = -1 ECHILD (No child processes)
rt_sigreturn({mask=[INT]})              = 0
close(3)                                = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
newfstatat(AT_FDCWD, "/home/trevorlarbs/.password-store/Test/random.gpg", {st_mode=S_IFREG|0600, st_size=621, ...}, 0) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
pipe([3, 4])                            = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, NULL, [], 8)  = 0
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], [], 8) = 0
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f0422e1ee50) = 249173
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigaction(SIGCHLD, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c8434a850, sa_mask=[], sa_flags=SA_RESTORER|SA_RESTART, sa_restorer=0x7f0422eccda0}, 8) = 0
close(4)                                = 0
rt_sigprocmask(SIG_BLOCK, [INT], [], 8) = 0
read(3, "Y2FuIHlvdSBzZWUgbWUgPz8/ICEK\n", 512) = 29
read(3, "", 512)                        = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=249173, si_uid=1001, si_status=0, si_utime=0, si_stime=0} ---
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], WNOHANG, NULL) = 249173
wait4(-1, 0x7ffd405c8a90, WNOHANG, NULL) = -1 ECHILD (No child processes)
rt_sigreturn({mask=[INT]})              = 0
close(3)                                = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
pipe([3, 4])                            = 0
rt_sigprocmask(SIG_BLOCK, NULL, [CHLD], 8) = 0
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], [CHLD], 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [INT TERM CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [INT TERM CHLD], NULL, 8) = 0
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f0422e1ee50) = 249635
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
close(4)                                = 0
close(4)                                = -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_BLOCK, NULL, [CHLD], 8) = 0
rt_sigprocmask(SIG_BLOCK, [INT TERM CHLD], [CHLD], 8) = 0
clone(child_stack=NULL, flags=CLONE_CHILD_CLEARTID|CLONE_CHILD_SETTID|SIGCHLD, child_tidptr=0x7f0422e1ee50) = 249636
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
close(3)                                = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) = 0
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
rt_sigprocmask(SIG_BLOCK, [CHLD], [CHLD], 8) = 0
rt_sigaction(SIGINT, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
wait4(-1, [{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 249635
wait4(-1, can you see me ??? !
[{WIFEXITED(s) && WEXITSTATUS(s) == 0}], 0, NULL) = 249636
rt_sigaction(SIGINT, {sa_handler=SIG_DFL, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, {sa_handler=0x556c84347ad0, sa_mask=[], sa_flags=SA_RESTORER, sa_restorer=0x7f0422eccda0}, 8) = 0
ioctl(2, TIOCGWINSZ, 0x7ffd405c96d0)    = -1 ENOTTY (Inappropriate ioctl for device)
rt_sigprocmask(SIG_SETMASK, [CHLD], NULL, 8) = 0
close(3)                                = -1 EBADF (Bad file descriptor)
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
--- SIGCHLD {si_signo=SIGCHLD, si_code=CLD_EXITED, si_pid=249635, si_uid=1001, si_status=0, si_utime=0, si_stime=0} ---
wait4(-1, 0x7ffd405c9190, WNOHANG, NULL) = -1 ECHILD (No child processes)
rt_sigreturn({mask=[]})                 = 0
read(255, "exit 0\n", 8192)             = 7
rt_sigprocmask(SIG_BLOCK, [CHLD], [], 8) = 0
rt_sigprocmask(SIG_SETMASK, [], NULL, 8) = 0
exit_group(0)                           = ?
+++ exited with 0 +++
\```

</p>
</details>  

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
CLI?](https://unix.stackexchange.com/questions/628092/why-would-gpg-pinentry-be-
slow-when-opening-in-gui-but-instantaneous-when-openin){:target="_blank"}
- [\[1\] pinentry slows down all of a sudden. old.reddit.com](https://old.reddit.com/r/GPGpractice/comments/q26tsf/pinentry_slows_down_all_of_a_sudden/?ref=share&ref_source=link){:target="_blank"}
- [\[2\] neofetch ](/neofetch.html){:target="_blank"}
	

- [understanding Apple's binary propert lists files](https://medium.com/@karaiskc/understanding-apples-binary-property-list-format-281e6da00dbd)
	
	
	
