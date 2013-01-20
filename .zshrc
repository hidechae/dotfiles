#yth to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="cloud"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github node osx perl)

# If you set specific setting, write in $HOME/.zshrc_origin. (e.g. ZSH_THEME)
if [ -e $HOME/.zshrc_origin ]; then
    source $HOME/.zshrc_origin
fi

source $ZSH/oh-my-zsh.sh
# source /home/hideyuki-utsunomiya/.zsh/zaw/zaw.zsh
# bindkey '^Xh' zaw-history
# bindkey '^X;' zaw

# Customize to your needs...

# cd .. like dired of Emacs
 function cdup() {
    echo
    cd ..
    zle reset-prompt
 }
 zle -N cdup
# bindkey '\^' cdup
# bindkey '`' cdup

export PATH=$PATH:$HOME/bin/
export EDITOR=vim
export HISTSIZE=100000;

RPROMPT="%n@%M"

alias rm="rm -i"
alias rf="rm -f"
alias cp="cp -i"
alias mv="mv -i"

# General Setting
setopt no_beep
setopt auto_cd
