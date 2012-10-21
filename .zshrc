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

source $ZSH/oh-my-zsh.sh
# source /home/hideyuki-utsunomiya/.zsh/zaw/zaw.zsh
# bindkey '^Xh' zaw-history
# bindkey '^X;' zaw

# Customize to your needs...
export PATH=$PATH:/home/hideyuki-utsunomiya/bin/

# cd .. like dired of Emacs
 function cdup() {
    echo
    cd ..
    zle reset-prompt
 }
 zle -N cdup
# bindkey '\^' cdup
# bindkey '`' cdup

export HISTSIZE=100000;

alias gacha="cd /home/gree/xgree/bootcamp/services/pcgacha/"
alias phpunit="/home/gree/common/php/bin/phpunit"
alias cdunittest="cd /home/gree/xgree/bootcamp/services/pcgacha/Service/Pcgacha/Module/"
alias unittest="sudo -u www-data /home/gree/common/pub/bin/phpunit --colors --bootstrap ../TestBootstrap.php test/"
alias utest="sudo -u www-data /home/gree/common/pub/bin/phpunit --colors --bootstrap /home/gree/xgree/bootcamp/services/pcgacha/Service/Pcgacha/TestBootstrap.php /home/gree/xgree/bootcamp/services/pcgacha/Service/Pcgacha/Module/test/"
alias phplog="tail -f /var/log/php.log"
LATEST_ACCESS_LOG="ls -lt /home/gree/xgree/bootcamp/services/pcgacha/log/access/access/*.dat | head -n 1 | awk '{print $8}')"
alias accesslog="tail -f LATEST_ACCESS_LOG"
alias db="mysql -h 116.93.145.228 --port=13806 -u root -p gree_bootcamp_pcgacha"
