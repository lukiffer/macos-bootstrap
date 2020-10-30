#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest Oh My Zsh from source"
}

function install() {
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "Oh My Zsh installed."
}
