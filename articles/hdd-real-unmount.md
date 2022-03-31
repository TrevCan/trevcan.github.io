Actually unmounting and removing power off HDDs

On windows 10, when ejecting a hard disk drive, it will stop
spinning. That is nice. It, of course, unmounts the partitions
before.

Linux does not do this automatically, at least not my minimalist
setup that only uses `dmenu`,`lsblk`,`mount`,`umount` and a little
of `grep`/`sed`/`other text-editing tools`.

When unmounting a drive using `umount` it merely unmounts the disk
partitions. It DOES NOT manage power, as far as I know.

To remove power from the HDD, I use a tool named `hdparm`, used to
set HDD parameters through the shell. The package should
be installed by default on 
[archlinux](https://archlinux.org/packages/core/x86_64/hdparm/),
[this is the project page](https://sourceforge.net/projects/hdparm/) 
(it has adware).

Anyways, to set the HDD params you need to be root. I don't know how
to set the permissions so that a normal user can do this, but I'm not
interested in learning how to do that cause if an attacker gains
command execution on my system I don't want them to have access to
managing my HDDs power.

I use this script:

```
	timeout 10s prompt "Remove power from $1 ? " "sudo -A hdparm -Y $1" &&
	notify-send "$ dmenuumount" "Power removed from ${1}. You may disconnect it now."
```

the important part is `hdparm -Y "$1"`. This flag `-Y` (yes, capital Y) means 
put the device in the 
lowest possible power mode. It will still be listed under `lsblk` but it will turn
on once you actually want to mount it. the `"$1"` is the path for the device, e.g.
`/dev/sde`.

As noted before, you must be root. 
**BE SURE to check the device, since running this **
**command on any devices you are using could fuck up the system!**

questions ? [contact](contact.html) me.

;tags: linux power devices
