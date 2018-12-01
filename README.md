# Why BASH?
It's not as sexy as Go, but BASH provides a fast and easy way to do 'small tasks'.

The Unix philosophy of "write programs that do one thing very well" spawned utilities
for shell programming, file manipulatring and text processing. Given that 'everything
is a file' in *nix, these utilities allow shell programming languages like BASH to be
powerful.

Nowadays, you can build an Alpine Linux container with BASH, GNU coreutils, sed, awk,
cURL and jq you can write some surprisingly useful scripts.

# When BASH?
There's no straight answer but I think these are good enough:
* If you don't need to distinguish between types
* If you don't need to work data structures
* If the script is under 500 lines long

# So what are bash-functions?
The goal of this repo right now is to act as a drop-box for the functions that I
write to make my life easier. If they're useful to others, that's a bonus.

Their usefulness may come in two parts:
1. Usef them in your script
2. Learn about coreutils you didn't know existed
