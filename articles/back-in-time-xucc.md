Going back in time and reading some of Zuckerberg's blog posts.


Yes, the Mark Zuckerberg!

More like... only one, unfortunately.

I'll make some commentary at the end.

I got it from [[0]](#references)

Here's the text:

**----BEGIN TEXT----**

10.28.03

8:13pm. I need to think of something to occupy my mind. Easy enough
now I just need an idea…

9:48pm. I’m a little intoxicated, not gonna lie. So what if it’s not even 10pm and it’s a Tuesday night? What? The Kirkland facebook is open on my computer desktop and some of these people have pretty horrendous facebook pics.
I almost want to put some of these faces next to pictures of farm animals and have people vote on which is more attractive. It’s not such a great idea and probably not even funny, but Billy comes up with the idea of comparing two people from the facebook, and only sometimes putting a farm animal in there. Good call Mr. Olson! I think he’s onto something.

11:09pm. Yea, it’s on. I’m not exactly sure how the farm animals are going to fit into this whole thing (you can’t really ever be sure with farm animals…), but I like the idea of comparing two people together. It gives the whole thing a very Turing feel, since people’s ratings of the pictures will be more implicit than, say, choosing a number to represent each person’s hotness like they do on hotornot.com. The other thing we’re going to need is a lot of pictures. Unfortunately, Harvard doesn’t keep a public centralized
facebook so I’m going to have to get all the images from the individual houses that people arein.
And that means no freshman pictures…drats.

12:58pm. Let the hacking begin. First on the list is Kirkland. They keep everything open and allow indexes in their Apache configuration, so a little wget magic is all that’s necessary to download the entire Kirkland facebook. Child’s play.

1:03am. Next on the list is Eliot. They’re also open, but with no indexes in Apache. I can run an empty search and it returns all of the images in the database in single page. Then I can save the page and Mozilla will save all the images for me.
Excellent. Moving right along…

1:06am. Lowell has some security. They require a username/password combo to access the facebook. I’m going to go ahead and say that they don’thave access to the main fas user database, so they have no way of knowing what people’s passwords are, and
the house isn’t exactly going to ask students for their fas passwords, so it’s got to be something else. Maybe there’s a single username/password combo that all of Lowell knows.
That seems a little hard to manage since it would be impossible for the webmaster to tell Lowell residents how to figure out the username and password without giving them away completely. And you do want people to know what kind of authentication is necessary,
so it’s probably not that either. So what does each student have that can be used for authentication that the house webmaster has access to? Student ids anyone? Suspicions affirmed –time to get myself a matching name and student id combo for Lowell and I’m in. But there are more problems. The pictures are separated into a bunch of different pages, and I’m way too lazy to go through all of them and save each one. Writing a perl script to take care of that seems like the right answer. Indeed.

1:31am. Adams has no security, but limits the number of results to 20 a page. All I need to do is break out the same script I just used on Lowell and we’re set.

1:42am. Quincy has no online facebook. What a sham. Nothing I can do about that.

1:43am. Dunster is intense. Not only is there no public directory, but there’s no directory at all. You have to do searches, and if your search returns more than 20 matches, nothing gets returned. And once you do get results, they don’t link directly
to the images; they link to a php that redirects or something. Weird. This may bedifficult.
I’ll come back later.

1:52am. Leverett is a little better. They still make you search, but you can do an empty search and get links to pages with every student’s picture. It’s slightly obnoxious that they only let you view one picture at a time, and there’s no way I’m going
to go to 500 pages to download pics one at a time, so it’s definitely necessary to break out emacs and modify that perl script. This time it’s going to look at the directory and figure out what pages it needs to go to by finding links with regexes. Then it’ll just go to
all of the pages it found links to and jack the images from them. It’s taking a few tries to
compile the script…another Beck’s is in order.



2:08am. Mather is basically the same as Leverett, except they break their directory down into classes. There aren’t any freshmen in their facebook…how weak.

**----END TEXT----**

# commentary

Wow, nice story. I was definitely able
to follow through with what he was
saying.
Although I must say, I don't know
how to code in perl.
But I do know what PHP is! So that's good ?
Hmmm, a lot of the tech hasn't changed.

Would definitely be fun to make this as a challenge. Making 
a faceSmash for my school !?

Dope! But a lot feminists would probably curse at me 
for an entire week straight and
I could get expelled.

I'd probably just need to steal some
credentials off one professor who
has enough admin privileges.


Hmmm, maybe I'll go back to this.
Hey friends! Don't kill me, if you
don't want me to do this then 
call me or something.


# references
- [0]: [Mark zuckerberg’s Livejournal Blog Post](https://kidsper.wordpress.com/2010/11/28/mark-zuckerbergs-livejournal-blog-post/) of course it's not the original.

;tags: archives

