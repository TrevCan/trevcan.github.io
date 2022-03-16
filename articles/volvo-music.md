Independence from closed technologies.

Hello there. I use spotify. My dad pays for it.

It allows me to listen to almost any popular artists and songs, even indie
creators are there to! I do not use the podcast features.

I doubt that I have found 'good' songs through Spotify ? But I might 
be wrong. My *liked songs* playlist is like 215 songs long, not bad I guess.

But yeah, a lot of consumption. Remember what happened to spotify like
less than a week ago ? Well, let me remind you. 
Spotify servers went down for whatever reason.

You open the app, your phone is connected to the internet. You want to 
listen to some **downloaded** songs. The app pings the auth server, doesn't
respond; logs you out. You are now unable to access any of your spotify music.

**YOUR**. Yours? Your music? Really yours ? doesn't sound like it.
You weren't doing anything wrong. You are a paying customer who gives
them money on a monthly basis through a platform that allows you to download
songs and audio. But restricted. You were not pirating anything. Yet you
were gated by the same company who built the software.

Were the devs instructed to do this ? I certainly hope not. And if they did
that on purpose, with all due respect, shame on you !

Ok, so enough backstory I guess.

For a while now I've been wanting to make myself more independent from software
I use. So I though about downloading all the music I have saved on spotify.

I can't easily download them from Spotify and decrypt them. Or maybe yes ? If
so, please [let me know](https://blog.trevcan.duckdns.org/contact.html).

Anyways, I eventually found some services which charge you for using the spotify
api to retrieve a list of all your playlists. But then I appended 'github'
to my search query and lo and behold, we have
[exportify](https://github.com/watsonbox/exportify/)!. It's an open source free
project that allows you to export any of your playlists, either imported or 
created by you! You can export all of them in bulk, or one by one if you prefer.

All the code runs 'in the browser', at least according to the git readme.

It is served 'statically'[0] through github pages @
[https://watsonbox.github.io/exportify/](https://watsonbox.github.io/exportify/).

the website needs javascript and an internet connection for it to work.
It will connect to the spotify api.

Ok, so then I exported all of them, unzipped them.

CSVs. hmmm. comma-separated values. simple enough I guess. With a shit-load
of boring spotify links and the title and artist. All I need.

Song title, song artist. That's it. After a few makefiles, some rambling
around with zsh and bashisms and weird shell syntax, I got awk and tr
to work for me. 

todo: add makefile here or somewhere

Ok, so once I got all my playlist songs, I converted each of them to
whatever I wanted.

Then I used yt-dlp (fork) to download the videos by appending the artist
name to the song, and using its own search engine to query from youtube.

so the code looked like this:

```
yt-dlp --default-search ytsearch: "$SEARCH_QUERY"
```

and I did that for each song.
And i added a couple flags here and there to tell it I want aac files and
metadata about the songs/videos. 

It took hours. Mainly because youtube detected that I was downloading
a shit-load of youtube videos and it wasn't normal.

Sometimes downloads were around 10 MB/s (yes, megabytes) but then they
circled down to maybe 700 kB/s or so. The popular songs were the ones
that got stalled.

The total size of all my songs and saved playlists on spotify was about
20 GB. Then I targzipped the shit out of it and got 18GB. Still a lot.

This was in the morning. I went to school. I couldn't use up 20 GB
out of my cell phone data carrier! Plus, the speed would be shit.

So I had to figure out a way to download it through my institution's
internet connection. Web server. I have a web server, a blog, and some
other stuff. I have directory listing enabled in some places. Yay.

I logged into my web server through ssh using my cellular data -
because my university has the port 22 blocked and won't allow me to 
ssh into my server - and proceeded to move the tar file
to a place where it could be showed by the web server, publically.

Of course, if you want to sue me. Just know that this falls under
personal use and no, I am not profiting from downloading these songs.

I am still paying for the same services I was paying before.
Please don't sue me.

Anyways, the tar.gz file was public and now was my computer's time
to shine. I'm on Linux and the download speed are incredibly good
on my uni's internet. When I'm on windows 10 they appear to be
stalled for some reason ! No, I don't know why.

Well, maybe because the servers for the school run linux or something.

I don't know. Point is, I started a wget command of the tar.gz file,
I got a stable 10 MB/s, going up to 15 at times.
wget said it would be done in about 2 hours. I was in my car. This was
perfect.

Then I guess a sysadmin caught me or something. A stable connection to
a server with around 10 MB/s for more than 10 minutes ? I was over https,
so I guess they didn't catch whatever I was downloading. So they
started to stall the download. wget showed literally --- where the speed
was. Actually, it first started slowing it down to maybe 8, then 7, then
six and five and four and three and one and two MB/s. Then to the 50x KB/s,
wow. sometimes it didn't respond at all. Other websites worked fine 
through a web browser. Speed was fine. It was probably a sysadmin blocking
my connection. I cancelled the download. I restarted it. Same problem.

So I started capping my download speed to 2 MB/s through wget. Fair enough.
Other people have more important things to do with these glorious internet
that sometimes gives a 300 ping on websites, but sometimes just a couple of 
milliseconds! so I capped it. And the sysadmin or network guy
or automated program kept stalling my download ! To like 300, then 500
KB/s. It was like a cat and mouse game. I was at 2 MB/s for a stable minute,
they got catch of it. Started to lower it to 1.5, 1, then 500 KB/s or just
stall it completely. But it was basically oscillating between 500 KB/s and
2 MB/s. Constantly, so yeah.

By that time, I was at lunch. Then I went out and left my computer downloading
the file with my friends. Eventually the computer started to complain.

It was almost out of battery. I was not there. It had less than ten percent
and it was beeping, I programmed it to do that. Thankfully. My friends
started asking questions to my computer as if it were a human being. 

All my computer did was beep, beep, and beep. The beep was consistent.
I laughed at the story when I arrived. If I had arrived maybe 15 minutes later,
it would have reached 0 and would be dead. Actually, my Lenovo T490 *kills*
itself like at 2% and does not allow you to turn it on. Well, it turns on
at 2% but like 5 seconds later it dies. So I was kinda just in time to charge
it. So I went inside, to the [tecbot workshop](http://team3158.tech/)
to charge my computer. I brought my backpack with me, as my charger was there.

Computer still not dead. Started charging it, all good.

then I went back to eat with my friends on some benches.

In total, I'd say the download took around five hours. Maybe six
with the first download. I reached like 15-20 % in the first one! I don't know
why I stopped it and started re-downloading it again.

So yeah, 18 GB of targzipped tarballed music. Started de-compressing it.

I didn't have enough space. I cancelled it. I connected my hard disk drive.

three tera-bytes. nice. I copied the tarball there and started decompressing.

It did take a while, maybe ten minutes at most I'd say. Not bad I guess.

After that, I had shit-loads of music. But at the time of writing this,

I haven't even put all the music onto a USB. i don't think I have another one
big enough for 18 GB worth of a lot of music. I could plug in
my hard drive. But the partition where I saved it at is ext4. I doubt the
volvo I drive will be able to read that. Plus, I don't want to fuck the HDD up.
Constant turning on and off, probably the disk spinners are not properly set
to 'power saving' mode when turning off the car. So no thanks. Maybe I'll use the
usb I have for operating systems. 32 GB. probably less usable storage. whatever.

I have an 8 gb spare usb, maybe I'll transfer the most important oses to it.

Ok, so now I have a shitload of music. I feel proud of myself.

I can even browse it through directory listing using http(*s*! included but not enforced!)
but it won't autoplay.

Maybe I'll look into creating a .pls file or a .m3u8 file for playlists. They allow
for absolute paths, not necessarily a server audio stream. so yeah, I should make some
code for that.

Also, the volvo I use does not allow a lot of media formats. It does accept mp3, but
I didn't have that. yt-dlp downloaded everything in opus, the first time I did tests.

Plus, the usb needs to be in fat32. I reformatted the 8gb usb just in case - it was
already fat32. Then i copied some of the songs I had downloaded on my computer. Before
the big 'all playlists' operation. But yeah, did not work the first time due to
audio file types. All were in opus. So i converted them to mp3s or something and
it worked.

Here are some useful links that helped me through my journey:

- [list of compatible file formats for volvo s60](http://www.m-sedan.com/compatible_file_formats_via_the_usb_socket-7435.html)

- [list of compatible file format for volvo s60. *official*](https://www.volvocars.com/en-th/support/manuals/s60/2014w46/audio-and-media/media-player/media-player---compatible-file-formats)

- [specification for connecting external storage devices to the volvo. specifies file system for HDDs and usbs](https://www.volvocars.com/en-th/support/manuals/s60/2014w46/audio-and-media/media-player/external-audio-source-via-aux-usb-input)

references

[0] I say statically in quotes because I tried copying the html to my computer and
	it didn't work. I got some error when trying to get the spotify token
	and setting up the spotify auth, apart from the fact that the html paths
	for the scripts and css were absolute, so I had to change them manually.

;tags: musique
