debugging blogit.

log: 
~ 6:24 P.M
git status has one untracked file.
only one. no changes on tracked files.
will try to build /deploy the site
without adding this new blog post.

# test 1

$ make main
a lot of text and shit
git status now shows indeed more 
untracked files; the new
blog post, the tags folder, the blog
folder and the www folder

----
I am now opening the www/index.html file
relative to the repo root.
Yayyy!!! it works like a charm. CSS works,
everything works.
The latest article I published is 
"Derivatives Stuff Calculus" and is indeed
correct. At the time of writing this, it is 
the only article that has been created,commited,
and pushed to the github and home server repo.
So yeah, it works.

small note:
*something i noticed is that sometimes the tags*
*were kind of misplaced, sometimes the tag TBA*
* appears almost at the start, near 'API' and 'C'*
*but now it seems to be in the 2nd line.*
**This  is definitely not the case when viewing **
**the version with the bad commit dates**
** [wrong sample](https://archive.md/9Fn0i/image)**

# test 2
ok, so as we can see in test #1, it worked like a 
charm when not adding any new files, having a clean
build dir and one new blog post (untracked file).

Now, I wonder something, if I did not commit
any changes, the last commit I made is the same as the
last one in the github repo, which means that they built
off of the same commited files. How can having
untracked files and a clean build dir affect this ??
who knows...

Now what i will do is execute a clean

$ make clean

now i will attempt building the site again and comparing
results. Keep in mind that I still have the untracked file.

$ make main

ok, great. Same thing, results are literally the same.
Honestly I expected this since the 'main' target in the 
makefile has as a first dependency the clean thingy.

*note: maybe it has to do something with the .PHONY thingy*
* in makefiles. that you're supposed to use it your targets*
* aren't actually files ??? *

okay. now to experiment # 3

# test 3
okay, so my plan for test 3 is the following. make clean,
then start tracking the new blog post i just made, 
	commit only that change, make clean again, and try to build.
	Between each of these operations, I will build and 'deploy'
	the site locally to see if it changes in any particular stage.

```
$ make clean
$ make main
```
I did it and then another main just to be safe and sure enough,
it is working persistently as expected.

```
$ git add articles/why-blogit.md
$ make main
```
Ok, still the same, since I haven't made a commit with the new
article, the article should not appear on the index, which is good
and works as expected. The other articles still appear in the right 
order. now let's commit changes!

```
$ git commit -m 'add blogit issue article'
$ make main
```
and sure enough, works like a charm! the new blog post appears
at the top and the next one is indeed the last one I committed, which
makes lots of sense. So, nothing wrong as of now.... now let's do exp 4

# test 4
so now i want to try to make a clean, and then a main.
```
$ make clean
$ make main
```
ok, great. It still works like a charm! literally got the same exact
content. now on to test 5

# test 5
I honestly do not know what to try now. I think in this one I'll checkout
to the last commit the github repo has (25f4b89, 5 h ago) and try building it.
	
first of all, I'll try to clean up.
```
$ make clean
$ git checkout 25f4b89 
$ make main
```
ok, so (un)fortunately I still have not found the bug! It still builds as if it
were very normal! In fact, it indeed builds correctly, but for some reason it did not when I
pushed it to github pages ??

now i really don't know wut to do.
now i will checkout to master

```
$ git checkout master
```
ok

# test 6
now i will attempt to push my latest commit to the github repo and to my home server, I will
try to see if behaviours change.
```
$ make clean
$ git push
```

ok, the github push built in like 25 seconds. so yeah, that's great i guess.
Now the moment of truth....  ah shitt.... for some weird reason it keeps
not using the correct commit date.
Weirdly enough, all the articles show the same DATE but not the same time.
the 404.md  simply says that it was allegedly last edited today, 11/10/21
@ 13:19:18. now my new blog post which appears at the bottom literally the
third one from bottom to top!, it says that iwas last edited also
today 11/10/21 @ 18:41:11 which is correct! now I do not know what the issue
is..!!

okay, now let's try pushing to the home server and seeing if we have the same results.
```
$ make clean
$ git push home-site
```
okay, I've pushed the master branch to the master branch at the home server, let's try this.
okay so I've built it from my home server. But now it shows somehwat wrong results but still
different than github. I reckon this has something to do with dates. This is getting interesting 
or idk. Now the first article at the top is 'How do i fix this blogit' which is, indeed,
the last article I committed. But the next one is 404, which is definitely not what I've committed
recently. next is about:trevcan, haven't made any recent updates, and so on. the second most 
recent article is right below the middle, the sixth one from bottom to top.

;tags: debugging sysadmin
