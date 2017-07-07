autoload -U compinit
compinit

if [ ./.aliases ]; then
    source ./.aliases
fi

