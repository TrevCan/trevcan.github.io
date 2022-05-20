The Usual Linux Problems


<https://www.linuxquestions.org/questions/linux-newbie-8/su-command-authentication-failure-753154/>

<https://askubuntu.com/questions/615790/maximum-time-for-which-a-linux-pc-can-be-up#615835>

# scripting

## what kinds of string interpolation does POSIX sh support ?

**By Gilles 'SO-stop being evil'**: source and license: [[0]](#references)

`--BEGIN--TEXT`

`"${blah}"` and `"$blah"` are portable shell syntax: they work on all POSIX-compliant shells as well as in traditional Bourne shells. POSIX also requires other features of variable expansion:

* String manipulation with `${VAR#PREFIX}`, `${VAR##PREFIX}`, `${VAR%SUFFIX}` and `${VAR%%SUFFIX}`.
* Conditional treatment of unset variables with `${VAR-DEFAULT}`, `${VAR=DEFAULT}`, `${VAR+FALLBACK}` and `${VAR?MESSAGE}` as well as the unset-or-empty variants with `:-`, `:=`, `:+` and `:?`.
* Variable length with `${#VAR}`.

In all cases, remember that the result of `$…` undergoes whitespace-splitting (more precisely, splitting at `$IFS` characters) and wildcard expansion (globbing) unless it's in double quotes (or a few other contexts that don't allow multiple words).

You can look up what exists in POSIX by reading the specification. Modern versions of POSIX are identical to the [Open Group Base Specifications](http://pubs.opengroup.org/onlinepubs/9699919799/idx/shell.html) (without optional components). Older versions are a subset of [Single Unix v2](http://pubs.opengroup.org/onlinepubs/7990989775/xcu/shellix.html).

Unix-like systems without a POSIX shell are extremely rare nowadays. `/bin/sh` is a non-POSIX Bourne shell on a few systems, notably Solaris, but a POSIX shell is available (`/usr/xpg4/bin/sh` on Solaris, and you should have `/usr/xpg4/bin` ahead of `/usr/bin` in your PATH). If you need compatibility with Bourne shells, check the man page on the systems you're interested in, as there have been many versions of sh with slightly different sets of features. [Sven Mascheck maintains a page with a lot of information](https://www.in-ulm.de/~mascheck/bourne/).

`--END--TEXT`

# references
- [0]: _What kinds of string interpolation does POSIX sh support?_
	- <https://unix.stackexchange.com/a/389659/497507>
	- License: CC BY-SA 4.0. <https://creativecommons.org/licenses/by-sa/4.0/>
