At last my error.

Instead of working I have found myself dealing
with some mysery and happiness.
Lots of both sometimes.
I miss things.
I think I miss writing.
I like writing at the two a.m. in the morning because why not.

Anyways, I recently bought myself something that actually uses the usb-c
port on my computer. The USB-C connection actually has a Thunderbolt 3 
controller and yes, in theory, I could just connect literally everything
I'd possibly ever need through that cable. 

I went to a Best Buy in Michigan to get a thunderbolt 3 capable dock
but to my surprise I did not find any of my liking. The thing that was 
missing the most was a Display Port. Literally none of them had it. 
Not even the extra expensive ones. I mean, they were all kinda equally
expensive, even though they're probably as shitty as one would expect
from too new technologies and not enough real manufacturing of them.

In the past month I stumbled upon a hacker news post talking about
thunderbolt 3 was.
The conclusion was that the expensive and ali-express bought docks
were just as equally likely to fail, not work at all, and or work
at advertised speeds. 

Anyways, I did find some interesting stuff at the best buy. I found a
micro-SD card reader that has both a USB type A (that's the regular
USB port you're used to) and a USB type C port. That's nice,
maybe I'll gift it to my sister who both owns a regular laptop without
USB type C and an iPad with a USB type C connector, hopefully this will
work if she has to transfer files faster. 

So I did buy that, I bought it *open box* [[0]](#references)!
I know, I'm a cheap, ain't I ?
Also, I bought a 100-watt USB-C power adaptor for my computer, to charge
it much, much faster. As a bonus, it has a 20-watt [[1]](#references) 
type-c port and a usb type-a with a little more amperage than your 
regular phone brick.

Anyways, I bought these two products. The power adaptor worked great.
I can now fast-charge off a single AC connection three devices at the
same time! Pretty neat. We'll see how hot she gets.

The micro-SD card reader did not work.
Well, the USB type-A connector did work. So that's good. I could access
the file system off my only not-lost micro-SD card and can play
the files just as well as I would on my computer's port.
But the type-C connection wouldn't work.
One of my first ideas was to try on a proprietary operating system
that normies call Windows.
(un?)Fortunately, same results. Only type-A would work.
Although something interesting was that power would indeed work.
I could charge my phone off the port easily. But I could not read
any data off any devices.

So I thought maybe BIOS drivers but wtf am  ieven saying idk. Idk
enough to know if the BIOS is in charge of this or not. Maybe Lenovo
weird firmware updates ?! I checked but nothing. Just annoying windows 10
fat updates. Some Linux stackoverflow questions pointed in weird directions.

# the culprit

the culprit
is that...
well... not-so-long ago I delved into my BIOS settings and chose to disable
the THunderbolt 3 port.
To my surprise, power was not cut-off the port and still worked like a 
charger and I therefore expected it to still be working.
But in fact I just jumped into my BIOS a few minutes ago and lo and behold
there it was the Thunderbolt 3 disable setting!
turned it right back up, worked like a charm.
Even if the connection
was not over thunderbolt 3, it encapsulates the type-C data port as well,
so that's that. Now I can access my micro-sd through an adapter connected
to a USB-C port that is accessed by a mostly open-source operating system.

nice.

## references

- [0] "*open box*". - I've never heard of this term
until a friend of mine who lives in the United States told me.
It means that a human presumably opened a product but did not use it.
Then this human returned the product and it is advertised on the price tags
with a discount and a label that says "open box". I bought this thingy for like
15 bucks (no tax), like 10 off. Has worked well enough so far.
- [1]
fast-charging baby!
which only my dad will get to use because i have an iPhone 6s which fits my 
needs. I'd love to jailbreak it. Or maybe not ?
Every time I think of doing it I don't have the correct iOS version for it
to work and I kinda don't want to possibly install  malware onto my phone.
WHy am I playing the devil's advocate - and not - every time I think of this ?

;tags: today
