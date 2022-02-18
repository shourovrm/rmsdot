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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/rms/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/rms/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/rms/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/rms/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
