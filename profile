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

# set PATH so it includes user's private bin directories
#PATH=$PATH:$HOME/bin:$HOME/.local/bin:~/DrMemory-Linux-2.0.0-RC2/bin:~/builds/idea-IC-182.3911.36/bin


#ENVIRONMENTAL VARIABLES
export PATH="$PATH:$HOME/.scripts:/tmp:/usr/local/lib/python3.6/distpackages:/usr/bin/pip3/:usr/bin/python3"
export TERMINAL="xterm"
export BROWSER="google-chrome"
export EDITOR="vim"
export VISUAL="vim"
export READER="zathura"
export RANGER_LOAD_DEFAULT_RC="FALSE"
export PYTHONPATH="/usr/bin/ranger"
#export DIP="192.168.0.6"

