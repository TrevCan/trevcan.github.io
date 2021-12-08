Today

Hello, I am bored. Also, I've thought of kinda making my own daily blog entries
so here is one!

Today, well, more like yesterday since it's already midnight. I'm actually 
waiting for my other laptop to finish copying a disk partition to another
disk. I'm using the one and only, legendary... dISk d3stroy3r !!! Yes,
that's right, I saw that in a Luke Smith Video! the thing is, I was
setting up the archivebox software which is basically a self-hosted
archive / wayback machine, pretty self-explanatory. I set it up with docker
and after a while of restarting it for some weird reason the home directory
of a new user I've created was being chmoded by docker or the software
and idk really know what happened. Eventually, I figured out that for some
stupid reason I had no disk space left on my home partition. But it only
marked like 30 gigs used, meaning that for some weird reason I didn't
extend the partition ? So i got out my trusty red usb with ventoy on it
(lets you boot multiple OSes easily) and hopped on to gparted. It's
literally just raw debian ( i think?, i've never tried it :v )
with gparted installed. it has an old school GUI like windows xp, has
work spaces, you can move windows around. a pretty solid desktop
environment. So, anyways, back to the story. I opened gparted and there
it was, like 100GB of free, unpartitioned, unallocated space! 
so yeah, i just extended the home partition and no errors baby!

By this point. I shutdown the laptop, disconnect the trusty usb with oses
and boot the computer, everything seems normal, although the error still
appears telling me that there's no disk space! Oh no, maybe the root 
partition?! So I just ran `df -h` to show available disk space on mounted
file systems, and low and behold!, indeed the root partition is full!
What!?, I only allocated 20GB to the root partition!?, who was the stupid
guy that did that ? (me of course) and then proceeded to create the swap 
and boot partitions right next to it so that no free space is available.
Yayyy!!? my self! So yeah, moving partitions around is more prone to errors.
Plus, if you move any of the boot and/or root partition your system might not
boot, not pretty. So, just to be safe I got a spare HDD and clone the root
and home partition to it, because why not? After that I'll probably just wipe
the boot partitions from an archlinux iso in the trusty usb and move the
partitions around hoping that I don't have any errors so that I can extend
the free space in the root partition! Might as well use the external HDD as
the whole home partition! Why not? hmm, idk I'll think about it.

Some other things I did during the day (december 07 2021) were walk with my
dog, her name is Candy. Just walked around the neighbourhood, went to some
benches/tables with grass and a lot of sun! and setup a tiny parasol (omg
is this actually a word in english! I couldn't believe that when duckduckgo
showed the translation of sombrilla from spanish into parasol in english ?!
wft, why don't we Mexicans use this parasol word? maybe some old people do).
Also, I was planning on reading some French(-speaking?) poetry and translating
words i didn't know with a small spanish-to-french and viceversa dictionary.
In the end I only read like half of one page and got bored and walked with my
dog again who was escaping.

Honestly, I though the disk destroyer MI (mission impossible): operation would
be done by now. But it's not!? 60GB copied baby! no idea if it will copy the
whole partition with the unused space? ah, maybe, maybe not...

later in the day I started to use my laptop to research how to take
screenshots of webpages and just sat there, contemplated my life appreciating
the fact that puppeeteer ( i still don't know if i got taht spelling right!)
exists. Yay, so I could take screenshots using the chromium browser in 
headless mode! Nice. Now I just want a way to make my own <http://archive.is>
or wayback machine! But without the shady tracking. I don't remember where
I heard but I think it has some serious web tracking and a ton-shit of 
cookies. I only like real cookies. smh. and i bake them with my sister and we
make the dough from scratch and they're delicious. and I like those cookies,
I do not like these virtual, weird-ass cookies. I like tasting them irl.

wow, got a 781 word count! This guy knows how to speak/write/whatevss.
anyways, back to the story. I was trying to figure out how to *'save'* the 
webpage. You know, how when you're in chrome/firefox and press ctrl+s and
it saves an html and the images i think as well. yeah, that. well, it turns
out there's no easy way per se of doing that. after kinda pulling my hair out
of my scalp I encountered the archivebox while searching through the aur for
*archive* to see if there was any kind of self-hosted software that was
like a little wayback machine! So it turns out it exists and I guess it kinda
works! the web UI is okay, maybe a little bloated, it has like fuck'in 11 
cookies, and most definitely not the kind you can eat! So yeah, now I can
archive urls and store them on my computer and let others archive urls and
save it to my computer, hope I don't get sued for archiving something that
other people aren't happy about. aahhhh, this disk destroyer thing isn't over
yet. My plan was to just reinstall grub and the boot partition and that's it
man! just re-make the `/etc/fstab` so that the new uuids are recorded and
that's it! But no!, it was my great idea to re-extend the partition so now 
it's copying everything! f**c it, i'm cancelling the operation and shrinking
the partition as small as I can! holy shit! I only use like 2.16 GB in my home
partition! no wonder docker was complaining! I shrunk the partition to 5 GB 
just to be safe and we should be re-installing and moving partitions round
nd round in no time ! Nice! gparted took literally less than 1 minute!

now just gotta create the boot partition from the usb thingy!

turned out great. kinda. was a few minutes wondering why there were no
kernels added to the grub config. Turns out kernels are installed in the 
boot partition! I deleted that partition!
who would have known that? silly me, just had to pacman -S
linux and remove the old linux-zen which was having trouble with docker.

done i guess. you should be able to see this site now. back in business
baby.

;tags: day
