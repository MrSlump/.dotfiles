# Source global definitions
#test -f /etc/bashrc && . /etc/bashrc

# User specific aliases and functions
set -o vi

#export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export PG_DUMP=/usr/pgsql-9.3

export PSQL_EDITOR='vim +"set syntax=sql" '

export PATH=/usr/local/bin:$PATH
export PATH=$PATH:`npm bin`
export PATH=$PATH:~/MyInstall

export HISTSIZE=9999
export EDITOR=vi
export CLICOLOR=1

export PS1='\u@\h:\w$(__git_ps1) \$ '
export PS1='\W$(__git_ps1) \$ '

# Mac
source ~/.dotfiles/git-completion.bash
source ~/.dotfiles/git-prompt.sh
source /usr/local/Cellar/tmux/*/etc/bash_completion.d/tmux 

alias ll="ls -ltr"
alias vi="vim"
alias h="history"
alias sc="screen"
alias less="less -N"
alias tmux="TERM=screen-256color-bce tmux"

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
