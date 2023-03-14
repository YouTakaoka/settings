# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# Set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# PATH settings
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/lib:/usr/lib64"

# Default editor setting
EDITOR=nano

# Locale settings.
export LANG=C.UTF-8
export LC_ALL=C.UTF-8
export LANGUAGE=C.UTF-8

# Cargo environment variables
if [ -f "$HOME/.cargo/env" ]; then
    . "$HOME/.cargo/env"
fi

### Sound settings
# I do not prefer running pulseaudio as systemd service
pulseaudio --start

# On the purpose of supressing following error:
# git: Gtk-WARNING cannot open display
unset SSH_ASKPASS

# set PATH so it includes user's private bin directories
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# pyenv settings
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
	  eval "$(pyenv init -)"
fi

# anaconda
export PATH="$HOME/anaconda3/bin:$PATH"

# Python path
export PYTHONPATH="$PYTHONPATH:$HOME/pymodules"

# texlive
MANPATH="$MANPATH:usr/local/texlive/2021/texmf-dist/doc/man"
INFOPATH="$INFOPATH:/usr/local/texlive/2021/texmf-dist/doc/info"
PATH="$PATH:/usr/local/texlive/2021/bin/x86_64-linux"

# CUE path
export PATH="$PATH:$HOME/go/bin"
