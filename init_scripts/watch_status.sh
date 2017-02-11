#!/bin/bash

# Find screen resolution, resize/reposition window to upper right corner,
# then print a short status

# Configured using iTerms2 with the following adjustments:
#     Appearance > Hide scrollbars
#     Profiles > Colors (Background/Black 000000, Cursor/White ffffff)
#     Profiles > Text > Font (14pt Menlo Regular, Anti-aliased)
#     Window > Transparency (max, Keep background colors opaque)

SCRIPT_PATH=${0%/*}

MAIN_WIDTH=1920
WINDOW_WIDTH=51 # font dependent

while sleep .3; do
    # AppleScript method
    #     http://superuser.com/questions/447295
    # xrandr also works, but it also launches XQuartz which is undesirable
    res_x=`osascript -e 'tell application "Finder" to get bounds of window of desktop' | awk -F',' '{print $3}' | sed 's/^ *//'`
    [ $res_x -gt $MAIN_WIDTH ] && res_x=$MAIN_WIDTH # in case of multi-screen
    
    pos_x=$(($res_x - $WINDOW_WIDTH))

    printf "\033[8;2;20t"       # resize; minimum is 2;20
    printf "\033[3;"$pos_x";0t" # reposition 
    printf "\033[1;1H"          # cursor at top left corner
    
    $SCRIPT_PATH/print_status.sh
    
    printf "\033[1;1H"          # cursor at top left corner (avoid blinking)
done