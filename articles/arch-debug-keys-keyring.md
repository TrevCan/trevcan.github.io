Debugging archlinux keyring breaking when updating.

# bug

you run `sudo pacman -Syu`, but then you get an error
**Key is marginal trust or whatever.**

solution:

# TLDR:

```
# pacman -Sy archlinux-keyring && pacman -Su
``` 
(assumes root)

See this Arch Post: <https://bbs.archlinux.org/viewtopic.php?id=267364>

`Key is marginal trust or whatever.`

Actually, RTFM! (me included lol). It's actually documented in the arch wiki: 
<https://wiki.archlinux.org/title/Pacman/Package_signing#Upgrade_system_regularly>

;tags: debugging archlinux
