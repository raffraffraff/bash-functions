#!/bin/bash
source ./bashlib

msg "${CYAN}${BOLD}Demo${RESET}"
horizontal_line

SIZE_HUMAN=$(file_size ./bashlib | data_size_human)
AGE_MINUTES=$(file_age -m ./bashlib)
msg "The bashlib is ${SIZE_HUMAN} and was created ${AGE_MINUTES} minutes ago"

echo -ne "${BOLD}${CYAN}"
horizontal_line
echo -ne "${RESET}"

msg "De-duplicating a block of text, keeping the ${BOLD}last${RESET} copy of each line..."
cat <<EOF | de_duplicate --last
one
two
one
three
five
three
four
one
EOF


horizontal_line

read -p "Enter an integer: " INTEGER
read -p "Enter a real number: " NUMBER
read -p "Enter a date string (compatible with the date command): " DATE

if is_int "${INTEGER}"; then
  echo "${INTEGER} is an int - well done"
else
  echo "${INTEGER} is not an int - go back to school"
fi

if is_num "${NUMBER}"; then
  echo "${NUMBER} is a number"
else
  echo "${NUMBER} is not a number"
fi

if date -d "$DATE" >/dev/null ; then
  echo "There are $(date_diff -s "now" "$DATE") seconds between now and $DATE"
fi

