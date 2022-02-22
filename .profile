# Profile file. Runs on login. Environmental variables are set here.

# Adds `~/.local/bin` to $PATH

export PATH="$PATH:$(du "$HOME/.local/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# tinytex path
export PATH="$PATH:$(du "$HOME/bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"

# nodejs path 
export PATH="$PATH:$(du "$HOME/node_modules/.bin" | cut -f2 | tr '\n' ':' | sed 's/:*$//')"


# Default programs:
export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="brave-browser-nightly"
export READER="mupdf"


# add shortcutrc
# [ ! -f ~/.config/shortcutrc ] && shortcuts >/dev/null 2>&1
# if [ -f ~/.config/shortcutrc ]; then . ~/.config/shortcutrc fi
# if [ -f ~/.config/aliasrc ]; then . ~/.config/aliasrc fi
