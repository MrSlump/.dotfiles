# Source global definitions
#test -f /etc/bashrc && . /etc/bashrc

# User specific aliases and functions
set -o vi

#export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export PG_DUMP=/usr/pgsql-9.3

export PSQL_EDITOR='vim +"set syntax=sql" '

export PATH=/usr/local/bin:$PATH
#export PATH=$PATH:`npm bin`
export PATH=$PATH:~/MyInstall
export PATH=$PATH:~/.composer/vendor/bin

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
