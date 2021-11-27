adding the fzf plugin to vim

hey there! I don't know why this came to me but I guess I've seen
several internet videos in which linuxy users are using a nice, fancy
prompt to search files. Turns out they're using
[fzf!](https://github.com/junegunn/fzf/)
, a nice tool to easily search for files in the command line. To some
degree I guess it is like a dmenu prompt but in a command line. So yeah,
by default it acts like a find any file recursively in the current directory,
yes, including hidden files; yet still acts like a standard unix command
that can take input from stdin (standard input) and only show those choices
and of course, prints to stdout the result.

So one can do something like

```
cat << EOF | fzf
one
two
three
four
john cena
EOF

```

and that will basically show you an interactive command line prompt which can
let you make a choice. This is kind of similar to pedantic software's choice 
tool by 
Sylvain Gauthier and Francois-Xavier Carton.
[Here's](https://pedantic.software/syg/blog/minimalism_2_choice.html) a blog
post from Sylvain in which he explains what his tool does and its uses. I
guess it kinda differs to some degree but yeah.

Anyway, back to the fuzzy finder. So after seeing how not so useful this was,
at least to me, I decided to make a quick internet search to see if I could 
use this in vim. And I could! As I've already said at the start of this post,
I've seen several internet humans use vim as a file-finder. So I cloned a
sample vim plugin which connects the fzf vim plugin which only gives core
functions but doesn't actually implement anything. So installing all these
stuff gives me a pretty prompt like this:
![fzf in vim](http://ix.io/3GeG)

and yeah that's cool, isn't it?
If you're interested in how to set it up I'll put the steps below:
1.	install fzf, can be found in the official Arch Linux repos and pretty much
any other distro
2.	install fzf core functions vim plugin; simply clone the official fzf repo
to `~/.vim/pack/plugins/start/fzfcore` to start the plugin on vim startup.

```
git clone "https://github.com/junegunn/fzf.git" ~/.vim/pack/plugins/start/fzfcore
```

note: this will only work if you have the vim pack functionality. It probably
is if you keep vim up to date. I think this was released in vim 8.0
3.	install [fzf.vim](https://github.com/junegunn/fzf.vim) as another vim
plugin. Same as step 2.

```
git clone "https://github.com/junegunn/fzf.vim" ~/.vim/pack/plugins/start/fzf.vim
```

And that should do the trick. Now just readthedocs @
[the fzf.vim docs readme](https://github.com/junegunn/fzf.vim#commands)
and tldr;: use `:Files` to search within your home dir, hit enter and the file
will be opened in vim. Also, it will show you a small preview (with syntax
highlighting, if [bat](https://github.com/sharkdp/bat) is installed.)

that's it for this blog post. should probably sleep.

It's quite simple. No, I didn't create any of
these config files but I guess sharing is caring, right?
