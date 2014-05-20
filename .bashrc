# prompt

## for __git_ps1
if [ -f $HOME/rc/local/etc/bash_completion.d/git-prompt.sh ]; then
    source $HOME/rc/local/etc/bash_completion.d/git-prompt.sh
fi

## bash
### $1:color, $2:element
function addopt () {
    red="\[\e[1;31m\]"
    green="\[\e[1;32m\]"
    yellow="\[\e[1;33m\]"
    bold="\[\e[1;01m\]"
    underline="\[\e[1;04m\]"
    rseq="\[\e[00m\]"

    color_var="$"$1
    lseq=`eval "echo ${color_var}"`
    echo "${lseq}${2}${rseq}"
}

lbr=`addopt yellow \[`
rbr=`addopt yellow \]`
time=`addopt green \\\t`
user=`addopt green \\\u`
at=`addopt yellow @`
host=`addopt green \\\h`
current=`addopt red \\\w`
# last=$(addopt red \>\>\>)
last=$(addopt red $)
git_branch_format=`__git_ps1`

PS1="$lbr$time$rbr $at$host"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
    PS1=$PS1'$(__git_ps1 " \e[1;33m(\e[00m\e[1;32mgit:%s\e[00m\e[1;33m)\e[00m")'
fi
PS1="$PS1\n$current $last "
export PS1


## mysql
export MYSQL_PS1=$'[\e[36m\\R:\\m:\\s\e[0m] \e[32m\\u@\\h:\\p\e[0m \\d\\nmysql> '

export EDITOR=vim
export HISTSIZE=100000;

# alias
alias rm="rm -i"
alias rf="rm -f"
alias cp="cp -i"
alias mv="mv -i"
alias ls="ls --color"
alias grep="grep --color"
alias l="ls -la"
alias d="cd"
alias diffnotab="diff -BbwE"

# show time if over 1sec
REPORTTIME=1

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
