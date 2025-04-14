### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/yanagi.tarou/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

# Source global definitions
#test -f /etc/bashrc && . /etc/bashrc

# User specific aliases and functions
set -o vi

#export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export PG_DUMP=/usr/pgsql-9.3

export PSQL_EDITOR='vim +"set syntax=sql" '

#jj::xexport PATH=/usr/local/bin:$PATH
export PATH=$PATH:`npm bin`
export PATH=$PATH:~/MyInstall
export PATH=$PATH:~/.composer/vendor/bin
export PATH=$PATH:~/.pub-cache/bin

export GOPATH="${HOME}/.go"
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

export HISTSIZE=9999
export EDITOR=vi
export CLICOLOR=1

export PS1='\u@\h:\w$(__git_ps1) \$ '
export PS1='\W$(__git_ps1) \$ '

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

test -f ~/.dotfiles/git-prompt.sh && {
  #export GIT_PS1_SHOWUNTRACKEDFILES=true
  #export GIT_PS1_SHOWCOLORHINTS=true
  #export GIT_PS1_SHOWDIRTYSTATE=true
  #export PROMPT_COMMAND='__git_ps1 "${debian_chroot:+($debian_chroot)}\[\033[01;32m\] \u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\$ "'
  source ~/.dotfiles/git-prompt.sh
}

#git config --global http.proxy http://$proxy:$proxyport
#export ftp_proxy=$http_proxy
#export rsync_proxy=$http_proxy
#export no_proxy="localhost,127.0.0.1,*.local,*.intranet,169.254/16"
#export ANT_OPTS="-Dhttp.proxyHost $proxy -Dhttp.proxyPort $proxyport"
#export npm_config_proxy=$http_proxy
#export npm_config_https_proxy=$https_proxy
#export JAVA_OPTS=$ANT_OPTS
#export SBT_OPTS=$JAVA_OPTS
#git config --global http.proxy http://$proxy:$proxyport

export LC_ALL=en_US.UTF-8
export PATH=$PATH:$HOME/Library/Python/2.7/bin
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
source `pip3 show powerline-status | grep -i loca | cut -d' ' -f2`/powerline/bindings/bash/powerline.sh
function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

alias ll="ls -ltr"
alias vi="vim"
alias h="history"
alias sc="screen"
alias less="less -N"
alias dirs="dirs -v"
#alias tmux="TERM=screen-256color-bce tmux -u"
alias tmux="tmux -u"
alias name="find . -name"
alias iname="find . -iname"
alias awslocal="USE_SSL=1 awslocal"

export HISTCONTROL=ignoreboth:erasedups   # no duplicate entries
shopt -s histappend                       # append history file
export PROMPT_COMMAND="history -a"        # update histfile after every command
#PROMPT_COMMAND="history -a;history -c;history -r;"

test "$TMUX" || tmux

#export DISPLAY=localhost:0.0
#sudo mount -t vboxsf Desktop ~/Desktop
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/mac/.sdkman"
[[ -s "/Users/mac/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/mac/.sdkman/bin/sdkman-init.sh"


test -f ~/.buz && {
  source ~/.buz
}


test -f ~/.dirs && {
  source ~/.dirs
}
export PATH="/usr/local/opt/node@10/bin:$PATH"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
