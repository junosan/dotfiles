#!/bin/bash

# Print short status
#     HH:MM (12-base hour : minute)
#     KB IP (keyboard input language, IP address country code)

SCRIPT_PATH=${0%/*}

input_lang=`$SCRIPT_PATH/input_lang.sh`
if [ -z $input_lang ]; then
    input_lang='  '
fi

ip_location=`curl -m2 -s freegeoip.net/xml/ | grep 'CountryCode' | sed -e $'s/\t//' -e 's/<[^>]*>//g'`
if [ -z $ip_location ]; then
    ip_location='NC'
fi

printf "\033[30;47m" # black letters on white background
date "+%I:%M"
printf "%s %s" $input_lang $ip_location
printf "\033[0m" # reset SGR
