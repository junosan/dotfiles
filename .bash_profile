export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export GREP_OPTIONS='--color=always'
export GREP_COLOR='1;35;40'

ulimit -n 8192
alias ssh-add='ssh-add -t 24h'


# miniconda
export PATH="/Users/yuno/miniconda2/bin:$PATH"
# export PATH="/Users/yuno/miniconda3/bin:$PATH"

# if [ $TERM_PROGRAM = 'Apple_Terminal' ] && [ -z $STY ]; then
#     Dropbox/Code/dotfiles/resize_terminal.sh
# fi 

if [ $TERM_PROGRAM = 'iTerm.app' ]; then
    if [ `ps | grep -c 'minidock'` = 1 ]; then
        export PS1=''
        Dropbox/Code/minidock/bin/minidock &
    fi
fi


# man colors
# https://russellparker.me/2018/02/23/adding-colors-to-man/
export MANROFFOPT='-c'
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2)
export LESS_TERMCAP_md=$(tput bold; tput setaf 6)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 7)
export LESS_TERMCAP_ue=$(tput rmul; tput sgr0)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)


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
if [[ $PS1 ]]; then
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

