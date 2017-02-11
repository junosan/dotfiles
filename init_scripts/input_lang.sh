#!/bin/bash

# Print currently selected input method's language (macOS only)

# Depending on the input method, language may be stored in key
#     "KeyboardLayout Name" or "Bundle ID" or "Input Mode"
# so instead of grep'ing for the key, we grep for the language

pair_list='U.S.;US Korean;KR Japanese;JP'

for pair in $pair_list; do
    lang=`echo $pair | awk -F';' '{print $1}'`
    code=`echo $pair | awk -F';' '{print $2}'`
    defaults read ~/Library/Preferences/com.apple.HIToolbox.plist AppleSelectedInputSources | grep -sq $lang && echo -n $code
done
