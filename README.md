# Why BASH?
TL;DR It's not sexy, but BASH is available on practically all Linux servers and
is sometimes that fastest way to automate small tasks. It's actually capable of
doing much more complicated things than you should _ever_ use it for.

The Unix philosophy of "write programs that do one thing very well" coupled with
the brilliant idea of pipes spawned utilities for shell programming, file
manipulation and text processing. Nowadays we can add more command line programs
like curl, jq, awk and more.

# When BASH?
There's no straight answer but I think these are good enough:
* If you don't need to distinguish between types or work with data structures
* If the script is likely to remain simple and under a few hundred lines

# What's in bashlib?
It is a collection of functions that save time while writing scripts.

# Dependencies
These utilities assume that you have, or can install, the GNU coreutils, sed, awk,
cURL and jq. The Dockerfile in this project builds a 20mb container that includes all
of these, so you can build a docker container in which to test your own scripts.
