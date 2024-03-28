Archiving iPhone photo albums without iTunes in Linux

Hello! My Mom asked me to archive the pictures and videos on her iPhone.
I tried doing it without iTunes and was somewhat successful! 
I was able to keep all of her albums!

One knows that iTunes can be a very buggy piece of software. I've personally 
backed up very few times iPhones using iTunes, as I do not really care
about having the apps backed up. I only care about the Photos and videos.

It should be as easy as connecting it to your computer, right? Well, no.
I mean, kind of. You can easily connect your iPhone to your Windows computer
and from your iPhone click on 'Trust this device' and it will magically open
up the access to your iPhone's DCIM folder which contains all your pictures.

I'm using Garuda Linux but I've been able to mount my iPhone with Arch Linux:
<https://wiki.archlinux.org/title/IOS>

Note: It was a pain in the ass finding the mount point of my iPhone in Garuda
Linux. They really didn't make it easy! Turns out it was in
`/run/user/1000/kio-fuse-OUJOte/`. I could see the files in the file manager,
but whenever I right clicked to open a terminal, it would drop me in the home
of my root user for some reason.

For those that would like to follow along, the shell I'm using is `zsh`.

The pictures in `DCIM/` have plenty of metadata in there. 
But the albums are nowhere to be found.
I remember looking back a while ago when making a backup of my iPhone
and I couldn't find anything interesting. But today I chose to look further.

And I found an SQLite database! It has a bunch of stuff about Photos. I found
it here: `/PhotoData/Photos.sqlite`.

# big big database

<small>or not so big, idk it was like 350 MB</small>

Now, after archiving all the pictures under `/DCIM` using `rsync --archive`
I manually wrote down the name of each album and the amount of pictures it had.
I copied the database to my backup and started looking. I started by making
a full dump with `sqlite3 Photos.sqlite .dump`. And that definitely took a 
while because for some reason I decided to read the sqlite file directly from
the iPhone. I definitely should have copied it over to my hard drive first.
Anyways, I started grepping in the dump for the names of the albums and found
that the table `ZGENERICALBUM` is an album description for all the albums.
It has the `Z_PK` column, this corresponds to the Album number, then
`ZCACHEDCOUNT`, which contains the total count of Pictures and Videos in the 
Album (the sum of `ZCACHEDPHOTOSCOUNT` and `ZCACHEDVIDEOSCOUNT` 
should be `ZCACHEDCOUNT`); the last relevant column is `ZTITLE` which you
guessed it... is the title for the album.

I also found another table called `Z_28ASSETS`. This contains a list of the
files that are in Albums. It took me a while before realizing the meaning
of the fields. I knew the first one was definitely the album number, so
`Z_28ALBUMS` corresponds to the `Z_PK` field in the `Z_GENERICALBUM` table. I
eventually found out that the field `Z_3ASSETS` translates to the `Z_PK`
field in the `Z_ASSET` (yes, "not ASSETS") table.

# Reconstructing the favorites album

But first I found out about the favorites album. This album isn't located
in the `ZGENERICALBUM`. After all, it isn't generic. It's actually located
in the `ZASSET` table. This is actually where all the pictures and videos
are. There are even fields with the coordinates of the location where your
picture was taken and a ton of other fields from which I don't really understand
their purpose. Anyways, the `ZFAVORITE` field is in the `ZASSET` table and
if its value is 1, it's in the favorite album. And there's also a field called
`ZDIRECTORY` and `ZFILENAME` and this gives us the exact path to get each
picture or video. So all I had to do to get the favorites album was:


```
sqlite3 Photos.sqlite "SELECT Z_PK,ZDIRECTORY,ZFILENAME FROM ZASSET WHERE ZFAVORITE=1;" > albums.favorites
```
We can generate the path with:

```
awk -F '|' '{printf("%s/%s\n", $2, $3)}' < albums.favorites > favorites.unreal
```

Now, just to rule out any bad pictures, I'll make sure that they exist by 
`ls`ing them:

```
for x in `cat favorites.unreal`;
do
ls ../$x
z=$?
if [ $z -eq 0 ]; then
echo $x >> favorites.real;
fi
done
```

This is my file structure:

```
DCIM/
	XYZAPPLE/
	...
dev/
	Photos.sqlite
albums/
	...

working directory: dev/
```

In my case, no files were removed from `favorites.unreal`. Now that we
have the file list in `favorites.real`, we can make symbolic links
in a folder and make that our favorites album:

```
mkdir -p ../albums/favorites && for x in $(cat favorites.real); do
ln -s ../../$x ../albums/favorites/${x##*/}
done
```

Note: the `${x##*/}` in zsh means anything that matches `*/` in `$x`
you shall remove. This will basically leave the filename only
without the rest of the path (`abc/gde/qed` -> `qed`).

Now your favorites folder should be in albums/favorites with all your pictures
and videos.

Note: There may appear slightly more pictures than there actually are on 
your iPhone's favorites album,
there may be some kind of 'picture deleted' field that I haven't found yet.

# Reconstructing the other albums

This was pretty hard. As I mentioned before, I knew that the first field 
`Z_28ALBUMS` in
the `Z_28ASSETS` table corresponded to the album number but I was unsure of 
the only other two fields: 
`Z_3ASSETS` and `Z_FOK_3ASSETS`. At first, I thought it was some kind of
permutation between the `XYZAPPLE` and the file itself but that didn't work 
out.
Eventually I was using `sqlitebrowser` and `sqlite3` at the same time on 
different tables and saw the exact numbers! I figured out that the field 
`Z_3ASSETS`
in the table `Z_28ASSETS` was the same as the field `Z_PK` in the `ZASSET`
table, the latter of which had the filename. Now it was just a matter
of putting everything together.

First, get the albums from sqlite:

```
sqlite3 Photos.sqlite "SELECT Z_PK, ZCACHEDCOUNT, ZTITLE FROM ZGENERICALBUM WHERE ZCACHEDCOUNT>0 and ZTITLE is not null;" > albums.list
```

Second, for each album we will create a directory in `album/` with the name and album number (apparently, Apple allows for two albums to have the same name so the album number Z_PK is added to differentiate between the two)

```
awk -F '|' '{printf("../albums/%06d_%s\n", $1, $3)}' < albums.list | xargs --delimiter "\n" mkdir -p
```

Now we will make another set of album folders to save all the `Z_3ASSETS` fields that match each album number and then for each album, we will iterate over the file list, get the file name from the `ZASSET` table and add a symbolic link to the album folder:

```
mkdir albums_data

awk -F '|' '{printf("albums_data/%d\n", $1)}' < albums.list | xargs --delimiter "\n" mkdir


for x in $(ls albums_data);
do
sqlite3 Photos.sqlite "SELECT Z_28ALBUMS,Z_3ASSETS,Z_FOK_3ASSETS FROM Z_28ASSETS WHERE Z_28ALBUMS is $x" | awk -F '|' '{ printf("%s\n", $2) }' > albums_data/$x/files;
	for file in $(cat albums_data/$x/files);
	do
	sqlite3 Photos.sqlite "SELECT ZDIRECTORY,ZFILENAME FROM ZASSET WHERE Z_PK is $file" | awk -F '|' '{ printf("%s/%s\n", $1, $2) }' | xargs -I .fname ln -s "../../.fname" ../albums/0*?${x}_*/
	done;
done;

```

# done!

If you did everything right, you should have an `albums` folder with many more
directories inside it!

I still haven't figured out how to rule out 'deleted' files, so if you
added a picture to an album and then removed it, it will probably appear.

The end.

.ps: info on the database:

```
TABLE ZASSET contains a lot of columns
column Z_PK			this is the file id
column ZDIRECTORY	this is the location XYZAPPLE/
column ZFILENAME	this is the file name XYZ.{HEIC,JPEG,PNG,MOV}

TABLE Z_28ASSETS contains 3 columns
column Z_28ALBUMS corresponds to the album number to which the file is part of.
column Z_3ASSETS is the identifier that corresponds to the Z_PK field in the Z_ASSET table
column Z_FOK_3ASSETS is something...


TABLE ZGENERICALBUM contains a lot of columns
column Z_PK is the number of the album
column ZCACHEDPHOTOSCOUNT is the photo count of the album
column ZTITLE is the album title

TABLE Z_27ALBUMLISTS idk what's in here
```

;tags: en bizarre tech write programming technical
