#!/bin/zsh -eu

# ==============================================================================
# macOS Development Environment Setup Script (zsh)
# ==============================================================================

set -o pipefail

# Helper: print section headers
section() {
  echo ""
  echo "======================================================================"
  echo " $1"
  echo "======================================================================"
  echo ""
}

# ==============================================================================
# System Prerequisites
# ==============================================================================

section "System Prerequisites"

#
# Xcode Command Line Tools
#
if ! xcode-select -p &>/dev/null; then
  echo "Installing Xcode Command Line Tools..."
  xcode-select --install
  echo "⏳ Waiting for Xcode CLT installation to complete..."
  echo "   Press ENTER after the installation finishes."
  read -r
fi

#
# Homebrew
#
export PATH="/opt/homebrew/bin:$PATH"
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  {
    echo ''
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
  } >> "${HOME}/.zprofile"
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew update
else
  echo "Homebrew already installed."
fi

# ==============================================================================
# Shell & Completions
# ==============================================================================

section "Shell & Completions"

brew list zsh-completions &>/dev/null || brew install zsh-completions
brew list docker-completion &>/dev/null || brew install docker-completion
brew list docker-compose-completion &>/dev/null || brew install docker-compose-completion

# ==============================================================================
# Version Control
# ==============================================================================

section "Version Control"

brew list git &>/dev/null || brew install git
command -v git-flow &>/dev/null || brew install git-flow
command -v gh &>/dev/null || brew install gh

# ==============================================================================
# Dotfiles
# ==============================================================================

section "Dotfiles"

if [[ ! -d ~/.dotfiles ]]; then
  git clone https://github.com/TaroYanagi/.dotfiles.git ~/.dotfiles
  find ~/.dotfiles -maxdepth 1 -type f -name '.*' -exec ln -sf {} ~ \;
else
  echo "Dotfiles already cloned."
fi

# ==============================================================================
# Editor (Vim)
# ==============================================================================

section "Editor (Vim)"

if ! vim --version 2>/dev/null | grep -q '+clipboard'; then
  brew install vim
fi

if [[ ! -d ~/.vim/bundle/Vundle.vim ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
else
  echo "Vundle already installed."
fi

# ==============================================================================
# Terminal Multiplexer (Tmux)
# ==============================================================================

section "Terminal Multiplexer (Tmux)"

command -v tmux &>/dev/null || brew install tmux
command -v reattach-to-user-namespace &>/dev/null || brew install reattach-to-user-namespace

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  echo "TPM already installed."
fi

# ==============================================================================
# CLI Utilities
# ==============================================================================

section "CLI Utilities"

command -v cocot &>/dev/null || brew install cocot
command -v bat &>/dev/null || brew install bat
command -v fzf &>/dev/null || brew install fzf
command -v parallel &>/dev/null || brew install parallel
command -v rg &>/dev/null || brew install ripgrep
command -v tree &>/dev/null || brew install tree

if ! command -v sshpass &>/dev/null; then
  brew tap hudochenkov/sshpass
  brew install hudochenkov/sshpass/sshpass
fi

command -v ngrok &>/dev/null || brew install ngrok/ngrok/ngrok

# fcgi: install the library, not a binary
brew list fcgi &>/dev/null || brew install fcgi

# ==============================================================================
# Networking & Security
# ==============================================================================

section "Networking & Security"

command -v cntlm &>/dev/null || brew install cntlm
brew list caddy &>/dev/null || brew install caddy
brew list mkcert &>/dev/null || brew install mkcert

# ==============================================================================
# Languages & Runtimes
# ==============================================================================

section "Languages & Runtimes"

# ------------------------------------------------------------------------------
# PHP
# ------------------------------------------------------------------------------

echo "--- PHP ---"

if ! command -v composer &>/dev/null; then
  brew install composer
fi

if command -v composer &>/dev/null; then
  composer global require --no-interaction \
    pdepend/pdepend \
    phing/phing \
    phploc/phploc \
    phpunit/phpunit \
    phpdocumentor/phpdocumentor \
    phpmetrics/phpmetrics \
    phpmd/phpmd \
    squizlabs/php_codesniffer \
    sebastian/phpcpd \
    psy/psysh \
    || true
fi

# ------------------------------------------------------------------------------
# Python
# ------------------------------------------------------------------------------

echo "--- Python ---"

command -v python3 &>/dev/null || brew install python3

if ! python3 -m pip show powerline-status &>/dev/null; then
  python3 -m pip install --break-system-packages powerline-status || \
    python3 -m pip install powerline-status || true

  mkdir -p ~/.config/powerline
  local powerline_location
  powerline_location=$(python3 -m pip show powerline-status 2>/dev/null | grep -i '^Location' | cut -d' ' -f2)
  if [[ -n "${powerline_location}" && -d "${powerline_location}/powerline/config_files" ]]; then
    cp -r "${powerline_location}/powerline/config_files/" ~/.config/powerline/
  fi
else
  echo "powerline-status already installed."
fi

# ------------------------------------------------------------------------------
# Node.js
# ------------------------------------------------------------------------------

echo "--- Node.js ---"

command -v node &>/dev/null || brew install node
command -v yarn &>/dev/null || brew install yarn
command -v npm &>/dev/null || brew install npm
command -v npx &>/dev/null || brew install npx

# ------------------------------------------------------------------------------
# Golang
# ------------------------------------------------------------------------------

echo "--- Golang ---"

if ! command -v go &>/dev/null; then
  brew install go
fi

if command -v go &>/dev/null; then
  export GOPATH="${GOPATH:-$HOME/go}"
  export PATH="$GOPATH/bin:$PATH"

  go install golang.org/x/tools/cmd/godoc@latest 2>/dev/null || true
  go install github.com/christophberger/goman@latest 2>/dev/null || true
fi

# gophernotes (optional — may fail if zmq build is problematic)
if ! command -v gophernotes &>/dev/null; then
  echo "Attempting gophernotes setup (optional)..."
  command -v pkg-config &>/dev/null || brew install pkg-config
  brew list zeromq &>/dev/null || brew install zeromq
  command -v jupyter &>/dev/null || brew install jupyter

  go install github.com/gopherdata/gophernotes@latest 2>/dev/null || true

  if command -v gophernotes &>/dev/null; then
    mkdir -p ~/Library/Jupyter/kernels/gophernotes
    # Attempt to copy kernel config if source exists
    local gophernotes_pkg="${GOPATH}/pkg/mod/github.com/gopherdata"
    if [[ -d "${gophernotes_pkg}" ]]; then
      local kernel_dir
      kernel_dir=$(find "${gophernotes_pkg}" -type d -name 'kernel' 2>/dev/null | head -1)
      if [[ -n "${kernel_dir}" ]]; then
        cp "${kernel_dir}"/* ~/Library/Jupyter/kernels/gophernotes/ 2>/dev/null || true
      fi
    fi
  fi
else
  echo "gophernotes already installed."
fi

# ------------------------------------------------------------------------------
# Java & JVM
# ------------------------------------------------------------------------------

echo "--- Java & JVM ---"

command -v java &>/dev/null || brew install --cask temurin
command -v mvn &>/dev/null || brew install maven

# GraalVM (optional, may need specific version)
brew list --cask graalvm-jdk 2>/dev/null || brew install --cask graalvm-jdk || true

# ------------------------------------------------------------------------------
# Scala
# ------------------------------------------------------------------------------

echo "--- Scala ---"

brew list sbt &>/dev/null || brew install sbt

# ------------------------------------------------------------------------------
# Kotlin
# ------------------------------------------------------------------------------

echo "--- Kotlin ---"

command -v kotlin &>/dev/null || brew install kotlin

# ------------------------------------------------------------------------------
# Dart
# ------------------------------------------------------------------------------

echo "--- Dart ---"

if ! command -v dart &>/dev/null; then
  brew tap dart-lang/dart
  brew install dart
fi

# ==============================================================================
# Cloud & Infrastructure
# ==============================================================================

section "Cloud & Infrastructure"

# ------------------------------------------------------------------------------
# AWS
# ------------------------------------------------------------------------------

echo "--- AWS ---"

if ! command -v aws &>/dev/null; then
  brew install awscli
fi

if ! command -v awslocal &>/dev/null; then
  python3 -m pip install --break-system-packages awscli-local || \
    python3 -m pip install awscli-local || true
fi

command -v rclone &>/dev/null || brew install rclone

# ecspresso
brew list kayac/tap/ecspresso &>/dev/null || {
  brew tap kayac/tap
  brew install kayac/tap/ecspresso
} || true

# session-manager-plugin
brew list session-manager-plugin &>/dev/null || brew install session-manager-plugin || true

# ------------------------------------------------------------------------------
# Terraform
# ------------------------------------------------------------------------------

echo "--- Terraform ---"

brew list tfenv &>/dev/null || brew install tfenv

# ------------------------------------------------------------------------------
# BOSH (Cloud Foundry)
# ------------------------------------------------------------------------------

echo "--- BOSH ---"

if ! command -v bosh &>/dev/null; then
  brew tap cloudfoundry/tap 2>/dev/null || true
  brew install bosh-cli || true
fi

# ==============================================================================
# Containers & Orchestration
# ==============================================================================

section "Containers & Orchestration"

# ------------------------------------------------------------------------------
# Docker
# ------------------------------------------------------------------------------

echo "--- Docker ---"

if ! command -v docker &>/dev/null; then
  brew install --cask docker || true
fi

brew list kompose &>/dev/null || brew install kompose || true
brew list orbstack &>/dev/null || brew install orbstack || true
brew list podman &>/dev/null || brew install podman || true

# ------------------------------------------------------------------------------
# Kubernetes
# ------------------------------------------------------------------------------

echo "--- Kubernetes ---"

command -v kubectl &>/dev/null || brew install kubernetes-cli
command -v minikube &>/dev/null || brew install minikube

# ==============================================================================
# CI/CD
# ==============================================================================

section "CI/CD"

if ! command -v drone &>/dev/null; then
  brew tap drone/drone 2>/dev/null || true
  brew install drone || true
fi

command -v circleci &>/dev/null || brew install circleci || true

# ==============================================================================
# API & Documentation
# ==============================================================================

section "API & Documentation"

brew list swagger-codegen &>/dev/null || brew install swagger-codegen || true

# ==============================================================================
# Database Tools
# ==============================================================================

section "Database Tools"

brew list --cask dbeaver-community &>/dev/null || brew install --cask dbeaver-community || true

# ==============================================================================
# Performance & Load Testing
# ==============================================================================

section "Performance & Load Testing"

command -v jmeter &>/dev/null || brew install jmeter || true
command -v wrk &>/dev/null || brew install wrk

# ==============================================================================
# Multimedia (commented out)
# ==============================================================================

# brew install ffmpeg
# brew install theora
# brew install vorbis-tools

# ==============================================================================
# Virtualization (commented out)
# ==============================================================================

# brew install --cask virtualbox
# brew install --cask vagrant
# brew install --cask vagrant-manager

# ==============================================================================
# Setup Complete
# ==============================================================================

section "Done"
echo "✅ Development environment setup complete!"
