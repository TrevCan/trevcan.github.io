How to get saved network passwords in Linux (Network Manager)

making this because sometimes i don't RTFM.

**Assuming you use the Network Manager daemon to manager network connections, follow
this procedure:**

go to this path: as root
```
/etc/NetworkManager/system-connections
```

Then try listing the directory with ls. you should see
a list of *.nmconnection files.

open the files and there will be the password and auth specific stuff.

;tags: tldr
