Working with git hooks.

edit: see end of post.

Hey there fellow read-capable human! I am here to tell you a story about
git hooks. Well, first let's talk a little bit about how remote repos work.

From the little knowledge I think I have, a git server can be run through ssh,
you must create a git user which is in fact the user you login as when pushing
your git object references. Most of the time, this will happen in a bare git
repo. That is, a repo which only contains the contents of what you would
normally expect the
```
.git
```
contents to be. So in fact there's no working directory but only history 
changes with reference objects and stuff. But in fact this is probably wrong,
as most people most likely use services such as github.com, gitlab.com, 
etcetera. And those websites can show you the files and in fact show you
the 'working directory' of you repo, and the files themselves. So most git
servers you interact with are probably not bare since the aforementioned
services show you the files. So I chose to setup a git server on my home server
, pretty straight forward. Setup some ssh keys to not be spammed or something.
Then I had the amazing idea to migrate my blog over to my home server so I 
did it and migrated slowly to [blogit](https://pedantic.software/git/blogit).
Actually, I started my own fork:
[github/trevcan/blogit](http://github.com/trevcan/blogit). So anyways, back to
the actual story.

My blog was doing okay until I started to try building server side. The problem
was that the articles were being messed up in terms of last edited and last
updated dates and I really didn't know what to do. Until I stumbled upon the
fact that having different locales can mess up programs such as the gnu's
coreutils program sort. So yeah, all I had to do was export LC_ALL=C to 
make it fix itself.

Then I wantd to find out how to automate this process. Since I could already
push to my own git server, I was able to use git hooks. But after that I kind
of got lost since the commands did execute but the index.html file was never
properly generated. This is due to the fact that git proudly changes some 
environment variables because it wants to and barely documented them [0].
So I stumbled upon [1] and then found out all I had to do was add the unset
function to that env variable since blogit uses git magic to figure out the
last updated and last edited things and it though my repo was somehwere else
when it wasn't so yeah. I actually haven't tested it and after I finish 
writing this blog post it will be the actual guinea pig to see if it actually
works. You know, so I don't get stuck in the 'automating somehting for hours
and not do any actual work' thing. So I'm writing this post as kind of
an obligatory thing since I barely have anything on the blog. I mean, I have 
like 20 articles but most of them barely say anything.

Anyways, I'm going to track this on git and commit and push I guess.

### references
- [0: Missing git hooks docs](https://longair.net/blog/2011/04/09/missing-git-hooks-documentation/)
- [1: git post update script does not work *stackoverflow.com*](https://stackoverflow.com/questions/9228921/git-post-update-script-does-not-work)
- 

guess what :( ?? it didn't work. apparently it's not pulling the latest changes
I push for some weird reason and when I pull them as the git user in a shell
it works perfectly fine and detects new changes. i removed some arguments
i had in the git pull command so let's see if that works.
