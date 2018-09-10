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
# git & completion
#
brew list bash-completion || brew install git bash-completion

#
# dotfiles
#
test -d ~/.dotfiles || {
  git clone https://github.com/TaroYanagi/.dotfiles.git ~/.dotfiles
  find ~/.dotfiles -maxdepth 1 -type f -name '.*' -exec ln -s {} ~ \;
}

#
# Vim & Vundle
#
(vim --version | grep +clip ) || {
  brew install vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PlugInstall +qall
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
which ngrok || brew cask install ngrok

#
# PHP
#
which composer || {
    brew install composer

    composer global require pdepend/pdepend
    composer global require phing/phing
    composer global require phploc/phploc
    composer global require phpunit/phpunit
    composer global require phpunit/dbunit
    composer global require phpdocumentor/phpdocumentor
    composer global require phpmetrics/phpmetrics
    composer global require phpmd/phpmd
    composer global require squizlabs/php_codesniffer
    composer global require sebastian/phpcpd
}

#
# Python
#
which python3 || brew install python3

#
# AWS-CLI
#
which aws || {
  pip3 install --user --upgrade awscli
}

#
# NodeJS Package Tools
#
which npm || brew install npm
which yarn || brew install yarn

#
# NodeJS Packages
#
#cd ~ && {
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
#}


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
# Java8 & Maven
#
(java -version 2>&1 | grep 1.8) || {
  brew tap caskroom/cask
  brew tap caskroom/versions
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
