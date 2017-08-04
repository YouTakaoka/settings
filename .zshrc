autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# PATH settings
export "PATH=$PATH:/usr/local/bin"

# set PATH so it includes user's private bin directories
export "PATH=$HOME/bin:$HOME/.local/bin:$PATH"

