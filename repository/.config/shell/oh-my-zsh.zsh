#!/usr/bin/env zsh

# -------------------------------- #
# VARIABLES
# -------------------------------- #

export EDITOR='nvim'

ZSH_THEME_RANDOM_CANDIDATES=(
  # "clean"
  # "jaischeema"
  # "nebirhos"
  # "philips"
  # "wezm+"
  # "wuffers"
  "terminalparty"
)

if [[ -n $SSH_CONNECTION ]]; then
  # ZSH_THEME="random"
  ZSH_THEME="terminalparty"
else
  ZSH_THEME="robbyrussell"
fi

source $ZSH/oh-my-zsh.sh
