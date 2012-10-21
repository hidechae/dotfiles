#!/bin/sh

echo 'if filereadable(expand('~/.vimrc.local'))
  source ~/.vimrc.local
endif' > $HOME/.vimrc

wget --no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh

echo 'source $HOME/rc/.zshrc
source $HOME/rc/.screenrc' > $HOME/.zshrc

source $HOME/.zshrc
