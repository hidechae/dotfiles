#!/bin/sh

if [ ! -e "$HOME/.oh-my-zsh" ]; then
    wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
fi

parent=`pwd`"/$0"
parent="${parent%/*}"

if [ -d "$HOME/.vim" ]; then
    echo -n "rm: descend into directory '$HOME/.vim'? "
    read ANS
    if [ "$ANS" = "y" -o "$ANS" = "yes" ]; then
        rm -rf "$HOME/.vim"
    fi
fi
sudo ln -s -i "$parent/.vim" "$HOME/.vim"
if [ -d "$HOME/bin" ]; then
    echo -n "rm: descend into directory '$HOME/bin'? "
    read ANS
    if [ "$ANS" = "y" -o "$ANS" = "yes" ]; then
        rm -rf "$HOME/bin"
    fi
fi
sudo ln -s -i "$parent/bin" "$HOME/bin"
sudo ln -s -i "$parent/.vimrc" "$HOME/.vimrc"
# sudo ln -s -i "$parent/.zshrc" "$HOME/.zshrc"
sudo ln -s -i "$parent/.bashrc" "$HOME/.bashrc"
sudo ln -s -i "$parent/.bash_profile" "$HOME/.bash_profile"
sudo ln -s -i "$parent/.inputrc" "$HOME/.inputrc"
sudo ln -s -i "$parent/.screenrc" "$HOME/.screenrc"
sudo ln -s -i "$parent/.gitconfig" "$HOME/.gitconfig"
sudo ln -s -i "$parent/.my.cnf" "$HOME/.my.cnf"

source $HOME/.zshrc
