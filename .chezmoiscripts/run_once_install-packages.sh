#!/bin/sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Sym link .tmux
ln -s -f .tmux/.tmux.conf
