#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest OhMyZSH from source"
}

function install() {
  if hash zsh 2>/dev/null; then
    echo "Zsh is already installed."
  else
    echo "Installing zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo "Zsh installed."
  fi
}
