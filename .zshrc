autoload -U compinit
compinit

if [ ~/.aliases ]; then
    source ~/.aliases
fi

# PATH settings
export "PATH=$PATH:/usr/local/bin"

# set PATH so it includes user's private bin directories
export "PATH=$HOME/bin:$HOME/.local/bin:$PATH"

# set $JAVA_HOME
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home
export ANT_HOME=$HOME/Ant
export ECLIPSE_HOME=/Applications/Eclipse.app/Contents/Eclipse/
export PATH=$PATH:$ANT_HOME:$ECLIPSE_HOME:$HOME/maven/bin
