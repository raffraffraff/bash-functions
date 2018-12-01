# Why BASH?
TL;DR It's not sexy, but BASH provides a fast and easy way to do small tasks

The Unix philosophy of "write programs that do one thing very well" spawned utilities
for shell programming, file manipulatring and text processing. Given that 'everything
is a file' in Unix-like systems, these utilities allow shell programming languages to
be quite powerful.


# When BASH?
There's no straight answer but I think these are good enough:
* If you don't need to distinguish between types
* If you don't need to work data structures
* If the script is under 500 lines long

# So what are bash-functions?
The goal of this repo right now is to act as a drop-box for the functions that I
write to make automation easier. If they're useful to others, that's a bonus.

# Usage
These utilities assume that you have, or can install, the GNU coreutils, sed, awk,
cURL and jq. The Dockerfile in this project builds a 20mb container that can run
these functions.
