Writing math in raw utf-8

# on web browsers and GUI apps

So apparently linux lets you use the keybinding `Ctrl+Shift+U` to
insert utf-8 characters, literally any utf-8 character. This is in
a non-terminal application such as libreOffice, Chromium, Firefox, etc.

Why does this work ? No idea. Don't know if this comes directly
from the kernel - or X11 / xorg -  but yeah, it works and I can type stuff 
like:

1 + 1 = √2

yes, that's a square root symbol in raw unicode ! without using
microsoft word with a laggy interface or whatever.

# utf-8 symbols on vim

On your terminal, it's quite hard to type them. the only reasonable
way is copying and pasting this character.

Anyways, if you are **writing in vim**, you should be able (by default)
to write utf-8 symbols in insert mode by pressing CTRL-V, yes `Ctrl`
and the letter `v`. Now you should be able to type `u` for unicode
and just write the unicode code for it. After you finish writing
the code, the character will appear on screen.

If it isn't appearing or you just see random whitespace, most likely
your terminal does not have the correct font installed or just neglects
that character.

## vim example

e.g. to write the capital letter E with a grave accent `È` you would do
the following. First, you'd find that the code is `U+00C8`. 
The hexadecimal code is `00c8`. Now you'd go into vim, get into insert or
replace mode [₇](#references), then type `Ctrl-V`, then type `u`, then
type the hex code `00c8`. After typing it, the character should appear
on-screen in your terminal!

Cool!

Now, I should add that i found a vim plugin.

## vim plugin

it kinda sucks <https://github.com/chrisbra/unicode.vim> tbh


some unicode tables on wikipedia that may be of use:

- tiny numbers and letters! 
[Subscripts and Superscripts](https://en.wikipedia.org/wiki/Unicode_subscripts_and_superscripts)
- [Latin 1 Supplement](https://en.wikipedia.org/wiki/Latin-1_Supplement#Character_table)
accents, grave, acute, dieresis, pretty much write in Spanish
- [Phonetic Extensions](https://en.wikipedia.org/wiki/Phonetic_Extensions)
self-explanatory.




## references

- [math symbols in unicode (utf-8)](https://en.wikipedia.org/wiki/List_of_Unicode_characters#Mathematical_symbols)
- [superscripts and subscripts](https://en.wikipedia.org/wiki/List_of_Unicode_characters#Superscripts_and_Subscripts)
- [all superscripts and subscripts in utf-8](https://en.wikipedia.org/wiki/Superscripts_and_Subscripts_(Unicode_block))
- [math operators](https://en.wikipedia.org/wiki/Latin-1_Supplement#Mathematical_operator)
- [https://www.unicode.org/charts/PDF/U2100.pdf](https://www.unicode.org/charts/PDF/U2100.pdf)
- [typing special characters in linux](https://www.maketecheasier.com/quickly-type-special-characters-linux/)
- [type unicode chars linux](https://frameboxxindore.com/linux/how-do-i-enter-unicode-characters-in-linux.html)
- [Latin 1 Supplement, *wikipedia.org*](https://en.wikipedia.org/wiki/Latin-1_Supplement)
- [₇] - *X-Team.com*. *Inserting unicode characters in vim*.
<https://x-team.com/blog/inserting-unicode-characters-in-vim/>





;tags: math school whynot
