Debugging Linux chown operation not permitted

_yes, even for root!_

Main reason this happens is usually the permissions themselves.

If you ain't root you won't be able to change an external hard
drive mounted **without custom** permissions.

**TLDR; become r00t (root) !**

**TLDR 2; or just RTFM and man tf outta mount!**

```
man mount
```



# wait, you didn'T solve my PROBLEM!!

well, then, you are in some luck. You probably have a file
system that doesn't allow permissions. These file systems
include fat, vfat, fat32, and others. These file systems
may complain when trying to change permissions, so just
chown the root directory in which your external storage
device is mounted at and you'll probably be good to go in
order to add files without being root.


That is all. Thanks for reading my ted talk.


;tags: debugging linux hdd mount usb
