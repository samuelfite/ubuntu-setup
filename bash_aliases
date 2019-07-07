# #------------EVENTS------------------# #
alias restart='~/.scripts/restart.sh'
alias shutoff='~/.scripts/shutoff.sh'
# #------------VALGRIND------------------# #
alias valgrind='valgrind --leak-check=full --show-reachable=yes'

# #------------APPLICATIONS------------------# #
alias blf='/home/sam/.scripts/redshift.sh'
alias stui='cd /home/sam/builds/s-tui/ && python -m s_tui.s_tui'
alias Postman='/home/sam/builds/Postman/Postman'
alias ipmiview='/home/sam/builds/IPMIView_2.16.0_build.190528_bundleJRE_Linux_x64/IPMIView20'
alias gitkraken='/home/sam/builds/gitkraken'
alias calc='gcalccmd'
alias xsv='~/./builds/xsv/target/release/xsv'

# #------------COMMANDS------------------# #
alias killport='/home/sam/builds/killport'
alias eclipse='/home/sam/builds/eclipse/eclipse'
#open a new terminal in the current directory
alias newt='xterm &'

alias intellij='./home/sam/builds/idea-IC-182.3911.36/bin/idea.sh'

alias save_pass='git config --global credential.helper cache --timeout 32000'

alias brightness='xrandr --output eDP1 --brightness'
alias 2brightness='xrandr --output DP2-1 --brightness'
alias 3brightness='xrandr --output DP2-3 --brightness'

alias xrr='/home/sam/.scripts/xresources.sh'

#ranger and sudo ranger
alias r='/home/sam/scripts/ranger.sh'

alias sr='sudo /home/sam/scripts/ranger.sh'

alias settings='xfce4-settings-manager'

# #-----------CD SHORTCUTS--------------# #
#to be filled in


# #------------DIRECTORY NAVIGATION-----# #
alias up='cd ..'

alias up2='cd ../ ../'

alias up3='cd ../ ../ ../'

alias up4='cd ../ ../ ../ ../'

alias up5='cd ../ ../ ../ ../ ../'


#-----------DRIECTORY SIZE--------------# #
#use du -sh

#-----------DEFAULT ALIASES FROM .BASHRC--------------# #
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'








