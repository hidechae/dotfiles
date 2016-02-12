# prompt

## confirm color
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

## for __git_ps1
if [ -f $HOME/dotfiles/local/etc/bash_completion.d/git-prompt.sh ]; then
    source $HOME/dotfiles/local/etc/bash_completion.d/git-prompt.sh
fi

## bash
### $1:color, $2:element
function addopt () {
    red="\[\e[1;31m\]"
#    green="\[\e[1;32m\]"
    yellow="\[\e[1;33m\]"
    cyan="\[\e[1;36m\]"
    gray="\[\e[0;37m\]"
    bold="\[\e[1;01m\]"
    underline="\[\e[1;04m\]"
    rseq="\[\e[00m\]"

    # color 255
    blue="\[\e[38;05;069m\]"
    green="\[\e[38;05;083m\]"
    purple="\[\e[38;05;177m\]" # 135
    orange="\[\e[38;05;209m\]" # 202
    smokewhite="\[\e[38;05;250m\]"

    color_var="$"$1
    lseq=`eval "echo ${color_var}"`
    echo "${lseq}${2}${rseq}"
}

lbr=[ #`addopt gray \[`
rbr=] #`addopt gray \]`
time=`addopt blue \\\t`
user=`addopt purple \\\u`
at=`addopt smokewhite at`
in=`addopt smokewhite in`
host=`addopt orange \\\H`
current=`addopt green \\\w`
# last=$(addopt red \>\>\>)
last=$(addopt smokewhite $)

PS1="\n$time $user $at $host $in $current"

which brew >/dev/null 2>&1
if [ $? -eq 0 ]; then
    # Mac
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
        . $(brew --prefix)/etc/bash_completion
        PS1=$PS1'$(__git_ps1 " \e[1;33m(\e[00m\e[1;32mgit:%s\e[00m\e[1;33m)\e[00m")'
    fi
else
    # linux
    if [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
        PS1=$PS1'$(__git_ps1 " \e[1;33m(\e[00m\e[1;32mgit:%s\e[00m\e[1;33m)\e[00m")'
        PS1=$PS1'\[\e[1;33m\]''$(uptime | sed "s/^.*\(load average.*\)/ [\1]/g")''\[\e[00m\]'

    elif [ -f $HOME/dotfiles/local/etc/bash_completion.d/git-completion.bash ]; then
        source $HOME/dotfiles/local/etc/bash_completion.d/git-completion.bash
        PS1=$PS1'$(__git_ps1 " (\e[38;05;045m%s\e[00m)")'
    fi
fi

PS1="$PS1\n$last "
export PS1

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
# GIT_PS1_SHOWUPSTREAM=auto

## mysql
export MYSQL_PS1=$'[\e[36m\\R:\\m:\\s\e[0m] \e[32m\\u@\\h:\\p\e[0m \\d\\nmysql> '

export EDITOR=vim
export HISTSIZE=100000;

# alias
alias rm="rm -i"
alias rf="rm -f"
alias cp="cp -i"
alias mv="mv -i"
if [ -f /usr/local/bin/brew ]; then
  alias ls="ls -G"
else
  alias ls="ls --color=auto"
fi
alias grep="grep --color"
alias l="ls -la"
alias s="ls"
alias sl="ls"
alias c="cd"
alias d="cd"
alias where="which -a"
alias diffnotab="diff -BbwE"
alias screen="screen -U"

shopt -s autocd

# show time if over 1sec
REPORTTIME=1

# rubyenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# vimenv
if [ -r $HOME/.vimenv/bin:$PATH ]; then
    export PATH="$HOME/.vimenv/bin:$PATH"
    eval "$(vimenv init -)"
fi

export LANG=en_US.UTF-8
export PAGER=less

# aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

if [ -f ~/.colorrc ]; then
    eval `dircolors ~/.colorrc`
fi

export LESS='--no-init --quit-if-one-screen --RAW-CONTROL-CHARS'
alias ag="ag --pager='less -R'"
