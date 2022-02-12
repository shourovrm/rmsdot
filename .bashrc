# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Enable colors and change prompt:
# alias ls='ls --color=auto'

export PS1="\[$(tput bold)\]\[$(tput setaf 1)\][\[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 4)\]\h \[$(tput setaf 5)\]\W\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\\$ \[$(tput sgr0)\]"

#PS1='[\u@\h \W]\$ '

## starship bash prompt
eval "$(starship init bash)"

## source shrortcut and aliases 
. ~/.config/shortcutrc
. ~/.config/aliasrc 
alias config='/usr/bin/git --git-dir=/home/rms/.cfg/ --work-tree=/home/rms'
