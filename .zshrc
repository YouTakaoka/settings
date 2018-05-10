autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# PATH settings
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64"

# Locale setting
export LANG=en_US.utf8

# On the purpose of supressing following error:
# git: Gtk-WARNING cannot open display
unset SSH_ASKPASS

# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Java settings
export ANT_HOME=/usr/local/ant
export MAVEN_HOME=/usr/local/apache-maven-3.5.2
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
export PATH=${PATH}:${ANT_HOME}/bin:${MAVEN_HOME}/bin

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/yu/.sdkman"
[[ -s "/home/yu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/yu/.sdkman/bin/sdkman-init.sh"

# pyenv setting
if command -v pyenv 1>/dev/null 2>&1; then
	  eval "$(pyenv init -)"
fi

