# Why BASH?
TL;DR It's not sexy, but BASH provides a fast and easy way to do smaller tasks, and in
fact, you can probably do a lot more complicated stuff in BASH than you _should_.

The Unix philosophy of "write programs that do one thing very well" coupled with the 
brillian idea of pipes spawned utilities for shell programming, file manipulation and
text processing. Given that 'everything is Unix a file', this allowed shell scripts to
do almost anything, in a systems administration sense. This also means that in modern
sripts, those 'programs that do one thing very well' include curl, jq, awk etc. 

I will test all these functions in other shells (mainly zsh, but also dash, ash etc)
and update each one with compatibility info.

# When BASH?
There's no straight answer but I think these are good enough:
* If you don't need to distinguish between types
* If you don't need to work data structures
* If the script is <500 lines long (or even shorter, but y'know, scripts grow)

# So what's in 'bash-functions'?
The goal of this repo right now is to act as a drop-box for the functions that I
write to make automation easier.

# Dependencies
These utilities assume that you have, or can install, the GNU coreutils, sed, awk,
cURL and jq. The Dockerfile in this project builds a 20mb container that includes all
of these, so you can build a docker container in which to test your own scripts.
