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

export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# prompt for prezto
prompt steeef

alias sudo="sudo env PATH=$PATH"

function color () {
    for i in {0..255}
    do
        if [ `expr $i % 16` -eq 15 ]; then
            printf "\x1b[38;5;%03dm%03d\n" $i $i
        else
            printf "\x1b[38;5;%03dm%03d  " $i $i
        fi
    done
}

export LESS='--no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
alias ag="ag --pager='less -R'"
