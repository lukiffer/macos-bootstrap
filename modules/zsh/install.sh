#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest Oh My Zsh from source"
}

function install() {
  echo "Installing Oh My Zsh..."
  # Prevent installer from starting a zsh subshell inside the installer
  export RUNZSH="no"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "Oh My Zsh installed."

  # Restrict permissions for auto-completions
  chmod -R 755 /usr/local/share/zsh
}
