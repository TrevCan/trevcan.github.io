Resizing images on Linux while keeping aspect ratio.


bored ?, read [[0]](#references).

# tldr

`convert FILE -resize SIZE OUT_FILE`

`convert image.jpeg -resize 300x new-image.jpeg`

( resizes `image.jpeg` to `300x` width, scaling height accordingly
and writing it to `new-image.jpeg`)

Where `FILE` is the input image file you'd like to resize,
`SIZE` is the new size in pixels, e.g. `500x` will set a 
500x width and scale the height accordingly whilst keeping
the aspect ratio. And `OUT_FILE` is the output file. No,
it won't modify the original file.

That is all. oh, no. Dependencies!!

## dependencies
- imagemagick: <https://imagemagick.org/index.php>
  - available on the Arch repos and ubuntu, at least.


## references

- [0]: Yeah, yeah. Maybe SEO won't put this on the top cause the title
is too long and isn't that concise. Who cares!? I'm not an
ad-filled website. Yet.
- [1]: I originally got this off this ad-filled website:
<https://opensource.com/article/21/9/resize-image-linux>

;tags: guides
