autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# Keyboard setting
# xmodmap ~/.Xmodmap

# Locale setting
export LANG=en_US.utf8

# On the purpose of supressing following error:
# git: Gtk-WARNING cannot open display
unset SSH_ASKPASS

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Ant settings
export ANT_HOME=/usr/local/ant
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=${PATH}:${ANT_HOME}/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/yu/.sdkman"
[[ -s "/home/yu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/yu/.sdkman/bin/sdkman-init.sh"
