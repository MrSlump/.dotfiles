#!/bin/sh

#
# Xcode
#
xcode-select -p || xcode-select --install

#
# Homebrew
#
which brew || {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
  brew tap caskroom/cask
}

#
# dotfiles
#
#git clone https://github.com/TaroYanagi/.dotfiles.git ~/
#find ~/.dotfiles -maxdepth 1 -type f -name '.*' -exec ln -s {} ~ \;
#find ~/.dotfiles -type f -exec echo {} ~ +;

#
# Vim & Neobundle
#
#brew install vim
#curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
#cd ~/.vim/bundle/vimproc && make
#vim +NeoBundleInstall +qall

#
# Tmux
#
which tmux || brew install tmux
which reattach-to-user-namespace || brew install reattach-to-user-namespace
test -f ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#
# Command
#
which the_silver_searcher || brew install the_silver_searcher
which cocot || brew install cocot

#
# NodeJS & AngularJS & TypeScript
#
#brew install yarn
#brew install npm
#cd ~ && npm install angular-cli
#cd ~ && npm install phantomjs

#
# TypeScript
#
#cd ~ && npm install typescript
#cd ~ && npm install typings
#yarn add awesome-typescript-loader source-map-loader

# 
# React 
# 
#cd ~ && npm install create-react-app
#cd ~ && yarn add react react-dom


#
# Golang
#
which go || brew install go

#
# Kotin
#
which kotlin || brew install kotlin
#
# This is unsure.
#brew cask install xamarin-jdk
#
#brew install Caskroom/cask/java


#
# Setup tools
#
#brew install saltstack

#
# Apache Kafka
#
#brew install kafka 

#
# Docker
#
which docker || {
  brew install docker 
  brew cask install docker-toolbox
}
which virtualbox || brew cask install virtualbox 

#
# Movie Edtior
#
#brew reinstall ffmpeg -HEAD $(brew options ffmpeg | grep with-)
#brew install theora
#brew install vorbis-tools
