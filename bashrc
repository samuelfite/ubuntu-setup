# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
# ODFHIPJFDOSIJPOIDSJFOIJFDS

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
#if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
#    debian_chroot=$(cat /etc/debian_chroot)
#fi

# CHANGE COLOR OF PROMPT (\A = time)
# color names for readibility
reset=$(tput sgr0)
bold=$(tput bold)
black=$(tput setaf 0)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
white=$(tput setaf 7)
user_color=$green
#[ "$UID" -eq 0 ] && { user_color=$red; }
# if root
if [ "$UID" -eq 0 ]; then
    user_color=$red
fi
PS1="\[$reset\][\[$cyan\]\A\[$reset\]]\[$user_color\]\u@\h\
\[$reset\]: \w$ \[$reset\]"


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# VIM BINDING for terminal
set -o vi

function viewmd { pandoc $1.md -t HTML | wkhtmltopdf - $1.pdf && zathura $1.pdf; }
function viewtxt { pandoc $1.txt -t HTML | wkhtmltopdf - $1.pdf && zathura $1.pdf; }
export -f viewmd
export -f viewtxt

export PROMPT_COMMAND="pwd > /tmp/whereami"
export FQDN_OS_THIS_HOST="sam-ThinkPad-X1-Carbon-6th.datto.lan"

JAVA_HOME=/usr/local/java/jdk1.7.0_80
JRE_HOME=/usr/local/java/jdk1.7.0_80 
PATH=$PATH:$JRE_HOME/bin:$JAVA_HOME/bin:/home/sam/.local/bin

export JAVA_HOM
export JRE_HOME
export PATH



if [ ! -S ~/.ssh/ssh_auth_sock ]; then
  eval `ssh-agent`
  ln -sf "$SSH_AUTH_SOCK" ~/.ssh/ssh_auth_sock
fi
export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
ssh-add -L | grep "The agent has no identities" && ssh-add /home/sam/.ssh/id_rsa

#VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR
#PATH=$PATH:~/DrMemory-Linux-2.0.0-RC2/bin64
#trims the displayed working directory path
PROMPT_DIRTRIM=1
