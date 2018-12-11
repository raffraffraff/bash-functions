# Why BASH?
TL;DR BASH is available on practically all Linux servers and tends to be in most
docker containers (ignoring those that just contain a statically compiled Golang
binary, or Alpine with its cut-down 'ash' shell). In fact, since the world went
mad about containers, shell scripting has become arguably more important; if you
want to keep your container tiny, you might want to avoid installing a 'proper'
language like Python or Ruby to bootstrap your app, as they can add 30mb or more
while bash (in Alpine Linux) only adds 13mb, and in fact most of your bash will
run perfectly well in ash anyway.

# When BASH?
There's no right answer, but I think these situations are relevant:
* If you don't need to distinguish between types or work with data structures
* If the script is likely to remain simple and under a few hundred lines
* Docker container bootstrapping
* Ad-hoc work during an incident or investigation

# What's in this bashlib?
A small collection of functions that have simplified a few scripts for me.
* data_size_bytes - converts human-readable data to bytes (eg: 12GB > 12582912)
* data_size_human - converts bytes to human-readable (eg: 12582912 > 12GB)
* date_diff - outputs time between two dates in seconds, minutes, hours or days (eg: date_diff -s tomorrow yesterday)
* de_duplicate - de-duplicates lines in text without sorting, showing first or last instance of a line
* die - log an error message and exit the script with an error code
* error - log an error message to a file and stderr
* file_age - return the age of a file in seconds
* file_size - returns the size of a file in bytes
* horizontal_line - draws a horizontal line across the entire terminal
* msg - print an informational message to stdout
* is_int - tests if a value is an integer
* is_num - tests if a value is a number
* log - log a message to a file and stdout
* remove_special_chars - removes special characters (eg color codes) from text
* to_lower - converts all characters in text to lower case
* to_upper - converts all characters in text to upper case
* warning - log a warning message to a file and stdout

# Dependencies
Most of these functions run on the tiny Alpine Linux busybox/ash. However, some
may require GNU coreutils, gawk/nawk, GNU sed, jq or cURL.
