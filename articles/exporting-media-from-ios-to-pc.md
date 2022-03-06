How to copy all Pictures/Videos from iOS device

This guide is a tutorial to learn how to import ( and optionally delete) and browse your pictures and videos inside your iOS Device. You only need a working computer, a lightning-to-usb (with data transfer) cable, and an iOS device.

### non-features
- **You do not need another, external iOS Device, you do not need to pay Apple for iCloud, you do not need to download laggy, iTunes windows-and-mac only software.**

### features
- you can browse all pictures and videos saved in your iOS Device
- you can delete any pictures on said iOS Device
- you can copy all the pictures easily.
- you can do this from a Linux / GNU + Linux / *NIX machine.

the software used will be [libimobiledevice](https://libimobiledevice.org/), a cross-platform software library used to communicate to iOS devices. [ifuse](https://libimobiledevice.org/#get-started) shall also be used to enable filesystem mounting.

# start

1. connect iOS device. Click allow for computer pop-up thing.

assuming usbmuxd service is active,
use the idevicepair command to connect to your device:
```
$ idevicepair pair
```

yeah, the command argument seems redundant. You should get some
'SUCESS: Paired with ' 
and a long string of characters.

2. mount filesystem.

assuming you have ifuse installed,
use this command:

```
# ifuse -o allow_other MOUNTPOINT
```

where mountpoint is an existing directory.

3. Access. Access your mountpoint.
Keep in mind user permissions, 
you may have to chmod the directory
beforehand to be able to gain
access as a non-root user.

now you can enter the file system.

You should get a lot of folders
when browsing the root dir. 

The important folder is DCIM.

all pictures are there. **Careful!**

You can write to this folder.


# delete photos

If you want to delete the pictures just
do an rm -rf of the *APPLE folders
under DCIM. Careful!

Pictures will still be cached in
the device, so you'll need to cause
a database rebuild of your camera
roll:

```
# cd <mountpoint>/PhotoData
# rm Photos* com.apple.photos.caches_metadata.plist
```

that's it. you can also browse your
ringtones, there's a folder.

you can also write to it, but I haven't found a way to let new ringtones appear in the list.

Right now what I do is generate a new one from garageband, choose a name,
then import it. connect device. copy m3u ringtone to the dir and change its name to one of the custom ringtones. that works. 

# files?

I haven't found a way to access
the 'files' within the iOS File Manager. For now, I use this thing called 'snapdrop' to serve over LAN a couple files here and there.


that's it! Something you want to add
or critique ? Go ahead and [contact](https://trevcan.duckdns.org/blog/contact.html) me!



resources:
- [ArchLinux Wiki: iOS](https://wiki.archlinux.org/title/IOS)
