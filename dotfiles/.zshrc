export EDITOR=vim
export HISTSIZE=100000;

# General Setting
setopt no_beep
setopt auto_cd

# alias
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias l="ls -la"
alias d="cd"
alias diffnotab="diff -BbwE"

# for Mac
alias cache="sudo watch -n 1 \"du -a /private/var/folders | sort -nr\""

# disable autocorrect
unsetopt correct_all

# show time if over 1sec
REPORTTIME=1

# mysql
export MYSQL_PS1=$'[\e[36m\\R:\\m:\\s\e[0m] \e[32m\\u@\\h:\\p\e[0m \\d\\nmysql> '
