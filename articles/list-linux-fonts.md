Listing Installed Fonts on *NIX systems

weird, right !?

There's the `fc-list` command.
This binary is installed with the `fontconfig` package on Arch Linux.

But if you don't want to install `1.1 MB` of not-so-useful
stuff, you can list your installed fonts by going to this directory:

`/usr/share/fonts`

then you can run something like `tree`. There will be several folders and 
a ton of `.ttf` files.
my dir listing looks like this:

```
> ls /usr/share/fonts
adobe-source-code-pro  gnu-free           liberation  old            ttf-linux-libertine
cantarell              gsfonts            misc        TTF            xscreensaver
encodings              kanjistrokeorders  noto        ttf-jetbrains

```

you can now get all your installed fonts on your Linux system!

## references 

- <https://ostechnix.com/find-installed-fonts-commandline-linux/>

;tags: linux guides 
