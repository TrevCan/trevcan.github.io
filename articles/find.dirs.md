Finding empty directories

based on this article: [https://www.linuxshelltips.com/find-and-delete-empty-directories-in-linux/](https://www.linuxshelltips.com/find-and-delete-empty-directories-in-linux/)

Problem is: I have a linux shell script that lets me mount hard drives,
usb, and other storage devices. But if I have already mounted 
some storage device and it has a lot of folders, my command will
keep looking for empty folders where other storage devices can
be mounted. In other words, I have a directory `/media/` where all
the folders for external devices are created. I mount my big HDD
with a ton of folders to - let's say - `/media/HDD_0`. Now it is
available and there are thousands upon thousands of files available
under `/media/HDD_0`. Now I want to mount **another** device. What
my script does if find empty folders under `/media/` but it will
find it recursively.

So the solution is using the `-maxdepth n` option for the `find` command.
This allows you to set a maximum depth in which to look. Pretty 
self-explanatory, right ? So in other words, if I give `find` a 
starting point of `/media/` it won't go more than `n` folders
recursively. That's it.

Yeah, I use the [LARBS voidrice](https://github.com/LukeSmithxyz/voidrice)
`dmenumount` script, apparently the github does have a max-depth but I
think I removed that because I only wanted to look under `/media/`. 

But hey, I fixed it with the magic of the internet and reading man-pages
and at times bashing my head at my own hands or arms.

;tags: debugging linux files
