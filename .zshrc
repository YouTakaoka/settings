autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# On the purpose of supressing following error:
# git: Gtk-WARNING cannot open display
unset SSH_ASKPASS

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# Ant settings
export ANT_HOME=/usr/local/ant
export JAVA_HOME=/usr/lib/jvm/java-1.8.0
export PATH=${PATH}:${ANT_HOME}/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/yu/.sdkman"
[[ -s "/home/yu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/yu/.sdkman/bin/sdkman-init.sh"
