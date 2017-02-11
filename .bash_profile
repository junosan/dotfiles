export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

ulimit -n 8192
alias ssh-add='ssh-add -t 12h'


INIT_SCRIPTS_DIR=Dropbox/Code/dotfiles/init_scripts

if [ $TERM_PROGRAM = 'Apple_Terminal' ]; then
    $INIT_SCRIPTS_DIR/resize_terminal.sh
else # iTerm2
    $INIT_SCRIPTS_DIR/watch_status.sh
fi


# NOTE: following are modified lines from Ubuntu's default .bashrc

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# colored prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
