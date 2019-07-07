#!/bin/sh
pgrep ssh-agent || eval $(ssh-agent bash) && echo "started agent" > /home/sam/agent_started.txt
pgrep ssh-agent && ssh-add && echo "added private key" > /home/sam/added_key.txt
