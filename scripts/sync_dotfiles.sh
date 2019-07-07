#!/bin/bash
dotfiles=(
"/home/sam/.bash_aliases"
"/home/sam/.bashrc" 
"/home/sam/.profile" 
"/home/sam/.tmux.conf" 
"/home/sam/.vimrc" 
"/home/sam/.xprofile" 
"/home/sam/.config/i3/config" 
"/home/sam/.config/ranger" 
"/home/sam/.Xresources" 
"/home/sam/.inputrc" 
)
for i in "${dotfiles[@]}"
do
    cp -rf $i /home/sam/Sync/T520dotfiles
done

#cp  -rf /home/sam/.profile /home/sam/Sync/T520dotfiles
#cp  -rf /home/sam/.tmux.conf /home/sam/Sync/T520dotfiles
#cp  -rf /home/sam/.vimrc /home/sam/Sync/T520dotfiles
#cp  -rf /home/sam/.xprofile /home/sam/Sync/T520dotfiles
#cp  -rf /home/sam/.Xresources /home/sam/Sync/T520dotfiles
#cp  -rf /home/sam/.config/i3/config /home/sam/Sync/T520dotfiles/i3/config
#cp  -rf /home/sam/.config/ranger /home/sam/Sync/T520dotfiles/
#cp  -rf /home/sam/.bash_aliases /home/sam/Sync/T520dotfiles
#cp  -rf /home/sam/.bashrc /home/sam/Sync/T520dotfiles
