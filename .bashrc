# prompt

## confirm color
function color () {
    for i in {0..255} ; do printf "\x1b[38;5;${i}mcolour${i}  "; done
}

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
    cyan="\[\e[1;36m\]"
    gray="\[\e[0;37m\]"
    bold="\[\e[1;01m\]"
    underline="\[\e[1;04m\]"
    rseq="\[\e[00m\]"

    color_var="$"$1
    lseq=`eval "echo ${color_var}"`
    echo "${lseq}${2}${rseq}"
}

lbr=[ #`addopt gray \[`
rbr=] #`addopt gray \]`
time=`addopt cyan \\\t`
user=`addopt green \\\u`
at=`addopt yellow @`
host=`addopt green \\\H`
current=`addopt red \\\w`
# last=$(addopt red \>\>\>)
last=$(addopt red $)
git_branch_format=`__git_ps1`

PS1="$lbr$time$rbr $at$host"
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
    PS1=$PS1'$(__git_ps1 " \e[1;33m(\e[00m\e[1;32mgit:%s\e[00m\e[1;33m)\e[00m")'
    PS1=$PS1'\[\e[1;33m\]''$(uptime | sed "s/^.*\(load average.*\)/ [\1]/g")''\[\e[00m\]'
fi
if [ -f /usr/local/Cellar/bash-completion/1.3/etc/bash_completion ]; then
    . /usr/local/Cellar/bash-completion/1.3/etc/bash_completion
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
alias sl="ls"
alias c="cd"
alias d="cd"
alias where="which -a"
alias diffnotab="diff -BbwE"

# show time if over 1sec
REPORTTIME=1

# rubyenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# vimenv
export PATH="$HOME/.vimenv/bin:$PATH"
eval "$(vimenv init -)"

# PATH
## my bin
export PATH=${HOME}/bin:$PATH
