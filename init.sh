#!/bin/sh

if [ ! -e "$HOME/.oh-my-zsh" ]; then
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
fi

parent=`pwd`"/$0"
parent="${parent%/*}"
sudo ln -s -i "$parent/.vimrc" "$HOME/.vimrc"
sudo ln -s -i "$parent/.vim" "$HOME/.vim"
sudo ln -s -i "$parent/.zshrc" "$HOME/.zshrc"
sudo ln -s -i "$parent/.screenrc" "$HOME/.screenrc"
sudo ln -s -i "$parent/.gitconfig" "$HOME/.gitconfig"
