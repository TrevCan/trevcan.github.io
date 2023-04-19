How to get a consistent RSS feed ?

It's hard. Well, maybe not that hard. But when
you coded a half-assed program to generate an RSS
feed using shell scripting inside a makefile it's gonna
be pretty hard to fix it.

I'm most likely going to rewrite all the RSS feed generator
in C. I hope that doesn't bring any more problems...

Well, it all began when one of my readers told me that he
was attempting to use the RSS feed and told me that it was 
broken. He didn't explain much else beyond that, aside from
the fact that the atom link was broken too. 

And by broken, he meant that it wasn't being properly parsed. But
the atom link just has been broken for a while - because the file
doesn't exist on purpose. I've been meaning to fix both, the RSS
and the Atom feeds which are very similar but just haven't had
the will to do it, until now apparently. I hope this will lasts
long enough that I am able to fix both problems.

Well, onto the story. So I replied back to him, thinking if I should
even reply. Should I reply right now saying the problem has been
acknowledged and I'll try to fix it or email him when it's fixed !?
I don't know. Well, I replied anyway, saying that the RSS generator
was probably doing something wrong and that caused the parsing in his
RSS feed to not work. I mean, just opening the file in chromium-
a web browser-
yielded a parsing error.

Turns out, the error was in the title of one of my blog posts. It 
had two `</em>` tags, literally. Notice that `</em>` is the closing
tag of `<em>` but turns out I forgot to write the opening `<em>`
tag in the title. I wanted a part my title to show up in italics
so that's what I thought I wrote in, one `<em>` and then one `</em>`
tag. But I wrote just two `</em>` instead. So the only
thing I had to do was remove one single slash character `/`, add
the file to staging through git with `git add file`, commit and
push to my server. Then wait for the blog to be generated. Because
it's not HTML. It's markdown and it has to be parsed first into html.
Then the RSS feed is generated and so on. 

I waited for it to finish, it took a minute and a half or so. Now I
checked again and there it was, without no error in chromium. Showing
the ugly XML file. Then I put in the RSS url into a free RSS viewer
[[0]](#references) and it worked! It really worked.

I was very proud of that. To be fair, I only found out about that wrong
`</em` because the chromium browser said error parsing at line something
column something. Still, that was fast debugging.  

# step 1 of making a better RSS feed

probably, code in something that removes all html special characters
such as html tags and replaces them with nothing. Or maybe its markdown
equivalent. e.g. replace `<em> bla bla </em>` with `_ bla bla _` and 
so on.

That's easy enough I guess, I'll do it later today maybe. I'm still unsure
of what I'm going to code or how I should fix the whole RSS feed generator
thing. I'm unsure if it should all go into one program. or if I should
outsource some tasks to the makefile that in turn, uses the `git` command
to get important things such as the date, file name, link, etc. Maybe
I should follow the UNIX way. 
**Your program should do the following: Do one thing and do it well**
Maybe I should have several tiny programs that help me and then pipe them
together. I think that sounds nice.

Please share your thoughts! 

# references
- [0] - <https://rss.app/>


;tags: meta debugging technical
