#!/bin/bash

# Resize and (automatically) reposition terminal window 
#     with $1: set 0-based position index from left-most
#     no arg : find an adequate index based on # of open terminal windows

# See 'Window manipulation' in XTerm Control Sequences
# http://invisible-island.net/xterm/ctlseqs/ctlseqs.html
# \033[3;(x);(y)t       -> move window to (x, y) from top-left corner
# \033[8;(rows);(cols)t -> resize text area to (rows, cols)
# \033[14t              -> window size in pixels printed as \033[4;(h);(w)t

SCRIPT_PATH=${0%/*}

# Set position of the 0-th window
POS_0_X=0
POS_0_Y=0

# Set size of window in rows and columns
SIZE_ROW=75
SIZE_COL=80
printf "\033[8;"$SIZE_ROW";"$SIZE_COL"t"

# Find the window width in pixels
# Note that "\033[14t" needs to be interpreted by tty before being stored
exec < /dev/tty
stty_backup=$(stty -g) # backup state
stty raw -echo min 0
printf "\033[14t" >/dev/tty
IFS=';' read -rd 't' csi4 window_height window_width
stty $stty_backup # restore state

# Calculate position
if [ $# -ne 0 ]; then
    pos_idx=$1
else
    # specific for macOS Terminal.app
    # (iTerm.app uses slightly different flags)
    pos_idx=`ps -a | grep "login -pf " | wc -l` # current number of windows + 1
    pos_idx=$(($pos_idx - 2))
fi

pos_x=$(($POS_0_X + $pos_idx * $window_width))
pos_y=$POS_0_Y

printf "\033[3;"$pos_x";"$pos_y"t"
