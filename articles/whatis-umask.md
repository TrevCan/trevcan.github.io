$ whatis umask anyways

So, linux and other operating systems use files.
You might have heard the expression 
_"On Linux, everything is a file."_

And Linux uses lots of files. And if everyone
had the same rights to all files, it'd be a mess.
Unprivileged users would be able to edit critical system files.

_small detour:_

So, in conclusion folks, applying personifying traits and giving 'rights'
to computer programs to do whatever they want **will** create trouble!
I'm talking to you, Github! No reason at all to change from _master_
to _main_. Completely absurd.

_detour ends here_

So the `ext4` filesystem has permission on files. I can get the permission
of a file using the `ls` command with some fancy options:

```
# -l stands for long options
$ ls -l articles/whatis-umask.md
-rw-r--r-- 1 john cena 780 May  2 21:03 articles/whatis-umask.md
```

where `john` is the owner of the file and `cena` is the group owner
of the file. and the first characters are what matter: `-rw-r--r--`
that garbougle of characters is weird! let's put some spaces!

`-rw- r-- r--`. Okay, looks better. These permissions are for the
user, group, and other, respectively. Yes, `john` and `cena` come
into play. `john` will have `-rw-`, `cena` will have `r--`, and
other will have `r--`. `rw` means read, write. `r--` means
read. `rwx` means read, write, execute. Yes, execute as in execute
programs. 

But cool thing is if it's a directory the `x` means you can create
files within the directory ! Try it out in a temp folder ! try making
a new dir, looking at file permissions of a folder with `ls -lad folder/`
and `chmod -x`ing it. can you create files ? folders ? what happens
if you revert the `-x` ? 

# what umask actually is 

the umask command returns the **inverse** file mask used to create
new files within the current shell. Yes, **INVERSE**. not the 'real'
mask you get with the `ls` command.

**EVEN more confusingly**, you can run the `umask -S`
command to get a set of friendly-looking 
permissions
like in the `ls` command which will now return the **real file mask**,
not the inverse. You can set the real permissions for your current
shell in the same way by just typing out the permissions you want.

e.g. 

```
umask -S u=rwx,g=rx,o=rx
```


# references
- [0]: _Umask command in linux_. Yes, it has ads.
<https://linuxize.com/post/umask-command-in-linux/>
- [1]: _File permissions and attributes_. Arch Linux wiki.
<https://wiki.archlinux.org/title/File_permissions_and_attributes>
- [2]: Linux NDG Unhatched. cisco Netacad.


;tags: tecnical linux bored
