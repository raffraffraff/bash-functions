# Why BASH?
TL;DR BASH is available on practically all Linux servers and tends to be in most docker containers (ignoring those that just contain a statically compiled Golang binary, or Alpine with its cut-down 'ash' shell). In fact, since the world went mad about containers, shell scripting has become arguably more important; if you want to keep your container tiny, you might want to avoid installing a 'proper' language like Python or Ruby to bootstrap your app, as they can add 30mb or more while bash (in Alpine Linux) only adds 13mb, and in fact most of your bash will run perfectly well in ash anyway.

# When BASH?
There's no right answer, but I think these situations are fine:
* If you don't need to distinguish between data types or work with data structures (even simple arrays are nasty in bash)
* If the script is likely to remain simple and under a few hundred lines
* Docker container bootstrapping in Alpine
* Ad-hoc work during an incident or investigation

# What's in this bashlib?
The bashlib is a small collection of functions that have simplified a few scripts for me.
* data_size_bytes - converts human-readable data to bytes (eg: 12GB > 12582912)
* data_size_human - converts bytes to human-readable (eg: 12582912 > 12GB)
* date_diff - outputs time between two dates in seconds, minutes, hours or days (eg: date_diff -s tomorrow yesterday)
* de_duplicate - de-duplicates lines in text without sorting, showing first or last instance of a line
* die - log an error message and exit the script with an error code (eg: die "I die" 2)
* error - log an error message to a file and stderr (eg: error "Woops")
* file_age - return the age of a file (in seconds by default, but accepts -s, -m, -h, -d)
* file_size - returns the size of a file (in bytes by default, but accepts -h|--human-readable)
* horizontal_line - draws a horizontal line across the entire terminal
* msg - print an informational message to stdout (eg: msg "Hello world")
* is_int - tests if a value is an integer
* is_num - tests if a value is a number
* log - log a message to a file and stdout
* remove_special_chars - removes special characters (eg: color codes) from text
* to_lower - converts all characters in text to lower case
* to_upper - converts all characters in text to upper case
* warning - log a warning message to a file and stdout

# Example
```
#!/bin/bash
source ./bashlib

msg "${CYAN}${BOLD}Demo${RESET}"
horizontal_line

SIZE_HUMAN=$(file_size -h ./bashlib)
AGE_MINUTES=$(file_age -m ./bashlib)
msg "The bashlib is ${SIZE_HUMAN} and was created ${AGE_MINUTES} minutes ago"

echo -ne "${BOLD}${CYAN}"; horizontal_line; echo -ne "${RESET}"

msg "De-duplicating a block of text, keeping the ${BOLD}last${RESET} copy of each line..."
cat <<EOF | de_duplicate --last
one
two
three
five
four
three
two
one
EOF

read -p "Enter an integer: " INTEGER
read -p "Enter a real number: " NUMBER
read -p "Enter a date string (compatible with the date command): " DATE

if is_int "${INTEGER}"; then
  msg "${INTEGER} is an int - well done"
else
  error "${INTEGER} is not an int - go back to school"
fi

if is_num "${NUMBER}"; then
  if is_int "${NUMBER}"; then
	  warn "${NUMBER} is a number, but is also an integer"
	else
    msg "${NUMBER} is a number"
	fi
else
  error "${NUMBER} is not a number"
fi

if date -d "$DATE" >/dev/null ; then
  echo "There are $(date_diff -m "now" "$DATE") minutes between now and $DATE"
fi

${BG_RED}${WITE}${BLINK}DEMO OVER${RESET}
```


# Dependencies
Most of these functions run on the tiny Alpine Linux busybox/ash. However, some may require GNU coreutils, gawk/nawk, GNU sed, jq or cURL.
