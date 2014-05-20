export EDITOR=vim
export HISTSIZE=100000;

# General Setting
setopt no_beep
setopt auto_cd

# alias
alias rm="rm -i"
alias rf="rm -f"
alias cp="cp -i"
alias mv="mv -i"
alias l="ls -la"

alias l="ls -la"
alias d="cd"
alias diffnotab="diff -BbwE"

# disable autocorrect
unsetopt correct_all

# show time if over 1sec
REPORTTIME=1

# mysql
export MYSQL_PS1=$'[\e[36m\\R:\\m:\\s\e[0m] \e[32m\\u@\\h:\\p\e[0m \\d\\nmysql> '

# rubyenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# PATH
## my bin
export PATH=${HOME}/bin:$PATH

## vim
export PATH=/usr/local/vim-7.3/bin:$PATH

## proton
PROTON_HOME="/home/hideyuki-utsunomiya/proton"
PATH=${PATH}:${HOME}
PATH=${PATH}:${PROTON_HOME}/src/server/node_modules/coffee-script/bin
PATH=${PATH}:${PROTON_HOME}/src/server/node_modules/.bin
PATH=${PATH}:${HOME}/.nvm/v0.4.12/bin
PATH=${PATH}:${GOROOT}/bin:${GOPATH}/bin
export PATH
