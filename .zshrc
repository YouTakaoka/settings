autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# prompt
PROMPT='%F{green}%n@%m:%c%f%% '


