#!/bin/sh -eux

#
# Xcode
#
xcode-select -p || xcode-select --install

#
# Homebrew
#
which brew || {
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap caskroom/cask
  brew tap homebrew/completions
  brew update
}

#
# dotfiles
#
test -d ~/.dotfiles || {
  git clone https://github.com/TaroYanagi/.dotfiles.git ~/
  find ~/.dotfiles -maxdepth 1 -type f -name '.*' -exec ln -s {} ~ \;
}

#
# Vim & Neobundle
#
(vim --version | grep +clip ) || {
  brew install vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  #curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
  #cd ~/.vim/bundle/vimproc && make
  #vim +NeoBundleInstall +qall
}

#
# Tmux
#
which tmux || brew install tmux
which reattach-to-user-namespace || brew install reattach-to-user-namespace
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#
# Command Tools
#
which tree || brew install tree
which rg || brew install ripgrep
which cocot || brew install cocot
which sshpass || {
  brew tap hudochenkov/sshpass
  brew install sshpass
}

#
# Python
#
which pip || brew install pip
which python3 || brew install python3


#
# NodeJS Package Tools
#
which npm || brew install npm
which yarn || brew install yarn

#
# NodeJS Packages
#
cd ~ && {
  printf
  #
  # AngularJS Cli
  #
  #npm install rxjs
  #npm install angular-cli

  #npm ls phantomjs || npm install phantomjs

  #
  # TypeScript
  #
  #npm ls typescript || npm install typescript
  #npm ls typings || npm install typings
  #yarn list awesome-typescript-loader || yarn add awesome-typescript-loader
  #yarn list source-map-loader || yarn add source-map-loader

  ##
  ## React
  ##
  ##npm ls create-react-app || npm install create-react-app
  #yarn list react || yarn add react-dom
  #yarn list react-dom || yarn add react-dom

  #npm ls json2yaml || npm install json2yaml
}


#
# Golang
#
which go || brew install go

#
# Setup tools
#
#brew install saltstack

#
# Apache Kafka
#
#brew install kafka

#
# AWS-CLI
#
which aws || {
  pip3 install --user --upgrade awscli
}

#
# Java8 & Maven
#
(java -version 2>&1 | grep 1.8) || {
  brew tap caskroom/cask
  brew tap caskroom/version
  brew cask install java8
}
which mvn || brew install maven

#
# Scala
#
brew install sbt

#
# Kotin
#
which kotlin || brew install kotlin


#
# Bosh
#
which bosh || {
    brew tap cloudfoundry/tap
    brew install bosh-cli
}

#
# CI
#
which drone || {
  brew tap drone/drone
  brew install drone
}

#
# Docker
#
which docker || {
  brew cask install docker
  brew cask install docker-toolbox
}


#
# VirtualBox
#
#which virtualbox || brew cask install virtualbox
#
# Vagrant
#
#which vagrant || {
#  brew cask install vagrant
#  brew cask install vagrant-manager
#}


#
# Loadin Testing
#
which jmeter || brew install jmeter
which wrk || brew install wrk

brew install bash-completion
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

#
# FFMpeg
#
#brew reinstall ffmpeg -HEAD $(brew options ffmpeg | grep with-)
#brew install theora
#brew install vorbis-tools
