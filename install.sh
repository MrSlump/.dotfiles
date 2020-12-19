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
which git-flow || brew install git-flow


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
which cocot || brew install cocot
which bat || brew install bat
which fzf || brew install fzf
which parallel || brew install parallel
which rg || brew install ripgrep
which tree || brew install tree
which sshpass || {
  brew tap hudochenkov/sshpass
  brew install sshpass
}
which ngrok || brew cask install ngrok
which fcgi || brew install fcgi


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
    composer global require psy/psysh
}

#
# Python
#
which python3 || brew install python3
pip3 show powerlinex-status || {
    pip3 install powerline-status
    mkdir -p ~/.config/powerline
    cp -r `pip3 show powerline-status | grep -i loca | cut -d' ' -f2`/powerline/config_files/ ~/.config/powerline/
}

#
# AWS-CLI
#
which aws || {
  pip3 install --user --upgrade awscli
}
which awslocal || {
  pip3 install awscli-local
}
whihch rclone || {
  brew cask install rcloneosx
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
which go || {
  brew install go
  go get -u golang.org/x/tools/cmd/godoc
  go get -u github.com/golang/lint/golint
  go get -u github.com/christophberger/goman
}
which gophernotes || {
  which pkg-config || brew install pkg-config
  which zmq || brew install zmq
  which jupyter || brew install jupyter
  which nteract || brew cask install nteract
  go get -u github.com/gopherdata/gophernotes
  mkdir -p ~/Library/Jupyter/kernels/gophernotes
  cp $GOPATH/src/github.com/gopherdata/gophernotes/kernel/* ~/Library/Jupyter/kernels/gophernotes
}


#
# Setup tools
#
#brew install saltstack

#
# Apache Kafka
#
#brew install kafka


#
# Using Swagger
#
brew install swagger-codegen

#
# Java8 & Maven
#
(java -version 2>&1 | grep 1.8) || {
  brew tap caskroom/cask
  brew tap caskroom/versions
  brew cask install java8
  brew cask install homebrew/cask-versions/java8
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
  brew install kompose
}

#
# Kubernetes
#
which kubectl || {
  brew install kubernetes-cli
}
which minikube || {
  brew cask install minikube
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
# CI
#
which snapcraft || brew install snapcraft
which circleci || brew install circleci


#
# Loading Testing
#
which jmeter || brew install jmeter
which wrk || brew install wrk

brew install bash-completion
brew install bash-completion@2

brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

#
# FFMpeg
#
#brew reinstall ffmpeg -HEAD $(brew options ffmpeg | grep with-)
#brew install theora
#brew install vorbis-tools


which linkcheck || {
  brew tap dart-lang/dart
  brew install dart
  pub global activate linkcheck
}



which cntlm || brew install cntlm
