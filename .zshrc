autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

