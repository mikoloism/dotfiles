#!/bin/bash

HERE=$(dirname $0)
. "$HERE/../../libs/COLOR.sh"

printf "${ICON} Git"

if [[ ! $(command -v "git") ]]; then
  printf "Git Command Not Exist"
  printf "Installing Git..."
  apt install git-all
fi

read -p "What is your USERNAME: " GIT_USERNAME
read -p "What is your EMAIL ADDRESS: " GIT_EMAIL
printf "Setup Git Configs into $HOME"
ln -sf "$HERE/.gitconfig" "$HOME/.gitconfig"

git config --global user.name "$GIT_USERNAME"
git config --global user.email "$GIT_EMAIL"
git config --global author.name "$GIT_USERNAME"
git config --global author.email "$GIT_EMAIL"
