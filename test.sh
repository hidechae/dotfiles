#!/bin/sh

parent="./$0"
parent="${parent%/*}"
ln -s -i "$parent/.vimrc" "$home/.vimrc"
ln -s -i "$parent/.vim" "$home/.vim"
ln -s -i "$parent/.zshrc" "$home/.zshrc"
ln -s -i "$parent/.screenrc" "$home/.screenrc"
