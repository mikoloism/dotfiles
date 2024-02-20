#!/usr/bin/env zsh

if [[ -n $SSH_CONNECTION ]]; then
  ZSH_THEME="random"
else
  ZSH_THEME="robbyrussell"
fi

source $ZSH/oh-my-zsh.sh
