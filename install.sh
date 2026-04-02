#!/bin/zsh -eux

# ==============================================================================
# macOS Development Environment Setup Script (zsh)
# ==============================================================================

# ==============================================================================
# System Prerequisites
# ==============================================================================

#
# Xcode Command Line Tools
#
xcode-select -p || xcode-select --install

#
# Homebrew
#
export PATH=/opt/homebrew/bin:$PATH
which brew || {
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ${HOME}/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew update
}

# ==============================================================================
# Shell & Completions
# ==============================================================================

brew list zsh-completions || brew install zsh-completions
brew install docker-completion
brew install docker-compose-completion
brew install docker-machine-completion

# ==============================================================================
# Version Control
# ==============================================================================

brew list git || brew install git
which git-flow || brew install git-flow
which gh || brew install gh

# ==============================================================================
# Dotfiles
# ==============================================================================

test -d ~/.dotfiles || {
  git clone https://github.com/TaroYanagi/.dotfiles.git ~/.dotfiles
  find ~/.dotfiles -maxdepth 1 -type f -name '.*' -exec ln -s {} ~ \;
}

# ==============================================================================
# Editor (Vim)
# ==============================================================================

(vim --version | grep +clip) || {
  brew install vim
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PlugInstall +qall
}

# ==============================================================================
# Terminal Multiplexer (Tmux)
# ==============================================================================

which tmux || brew install tmux
which reattach-to-user-namespace || brew install reattach-to-user-namespace
test -d ~/.tmux/plugins/tpm || git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# ==============================================================================
# CLI Utilities
# ==============================================================================

which cocot   || brew install cocot
which bat     || brew install bat
which fzf     || brew install fzf
which parallel || brew install parallel
which rg      || brew install ripgrep
which tree    || brew install tree
which sshpass || {
  brew tap hudochenkov/sshpass
  brew install sshpass
}
which ngrok || brew install ngrok/ngrok/ngrok
which fcgi  || brew install fcgi

# ==============================================================================
# Networking & Security
# ==============================================================================

which cntlm || brew install cntlm
brew install caddy
brew install mkcert

# ==============================================================================
# Languages & Runtimes
# ==============================================================================

# ------------------------------------------------------------------------------
# PHP
# ------------------------------------------------------------------------------

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

# ------------------------------------------------------------------------------
# Python
# ------------------------------------------------------------------------------

which python3 || brew install python3
pip3 show powerline-status || {
  pip3 install powerline-status
  mkdir -p ~/.config/powerline
  local powerline_location
  powerline_location=$(pip3 show powerline-status | grep -i loca | cut -d' ' -f2)
  cp -r "${powerline_location}/powerline/config_files/" ~/.config/powerline/
}

# ------------------------------------------------------------------------------
# Node.js
# ------------------------------------------------------------------------------

which npm  || brew install npm
which yarn || brew install yarn

# ------------------------------------------------------------------------------
# Golang
# ------------------------------------------------------------------------------

which go || {
  brew install go
  go install golang.org/x/tools/cmd/godoc@latest
  go install golang.org/x/lint/golint@latest
  go install github.com/christophberger/goman@latest
}
which gophernotes || {
  which pkg-config || brew install pkg-config
  which zmq        || brew install zmq
  which jupyter    || brew install jupyter
  which nteract    || brew install --cask nteract
  go install github.com/gopherdata/gophernotes@latest
  mkdir -p ~/Library/Jupyter/kernels/gophernotes
  cp ${GOPATH}/src/github.com/gopherdata/gophernotes/kernel/* ~/Library/Jupyter/kernels/gophernotes
}

# ------------------------------------------------------------------------------
# Java & JVM
# ------------------------------------------------------------------------------

which java || {
  brew install --cask temurin
}
which mvn || brew install maven
brew install --cask graalvm-jdk@17

# ------------------------------------------------------------------------------
# Scala
# ------------------------------------------------------------------------------

brew install sbt

# ------------------------------------------------------------------------------
# Kotlin
# ------------------------------------------------------------------------------

which kotlin || brew install kotlin

# ------------------------------------------------------------------------------
# Dart
# ------------------------------------------------------------------------------

which linkcheck || {
  brew tap dart-lang/dart
  brew install dart
  dart pub global activate linkcheck
}

# ==============================================================================
# Cloud & Infrastructure
# ==============================================================================

# ------------------------------------------------------------------------------
# AWS
# ------------------------------------------------------------------------------

which aws || {
  pip3 install --user --upgrade awscli
}
which awslocal || {
  pip3 install awscli-local
}
which rclone || {
  brew install --cask rclone
}
brew install kayac/tap/ecspresso
brew install session-manager-plugin

# ------------------------------------------------------------------------------
# Terraform
# ------------------------------------------------------------------------------

#brew install terraform
brew install tfenv

# ------------------------------------------------------------------------------
# BOSH (Cloud Foundry)
# ------------------------------------------------------------------------------

which bosh || {
  brew tap cloudfoundry/tap
  brew install bosh-cli
}

# ==============================================================================
# Containers & Orchestration
# ==============================================================================

# ------------------------------------------------------------------------------
# Docker
# ------------------------------------------------------------------------------

which docker || {
  brew install --cask docker
  brew install kompose
}
brew install orbstack
brew install podman

# ------------------------------------------------------------------------------
# Kubernetes
# ------------------------------------------------------------------------------

which kubectl || {
  brew install kubernetes-cli
}
which minikube || {
  brew install --cask minikube
}

# ==============================================================================
# CI/CD
# ==============================================================================

which drone || {
  brew tap drone/drone
  brew install drone
}
which snapcraft || brew install snapcraft
which circleci  || brew install circleci

# ==============================================================================
# API & Documentation
# ==============================================================================

brew install swagger-codegen

# ==============================================================================
# Database Tools
# ==============================================================================

brew install --cask dbeaver-community

# ==============================================================================
# Performance & Load Testing
# ==============================================================================

which jmeter || brew install jmeter
which wrk    || brew install wrk

# ==============================================================================
# Multimedia (commented out)
# ==============================================================================

#brew reinstall ffmpeg -HEAD $(brew options ffmpeg | grep with-)
#brew install theora
#brew install vorbis-tools

# ==============================================================================
# Virtualization (commented out)
# ==============================================================================

#which virtualbox || brew install --cask virtualbox
#which vagrant || {
#  brew install --cask vagrant
#  brew install --cask vagrant-manager
#}

# ==============================================================================
# Setup Complete
# ==============================================================================

echo "✅ Development environment setup complete!"
