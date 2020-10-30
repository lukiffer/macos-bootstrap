#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the zsh-autosuggestions plugin from source"
}

function install() {
  local -r auto_suggestions_path="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  if [ -d "$auto_suggestions_path" ]; then
    echo "Auto-suggestions for zsh already installed."
  else
    echo "Installing auto-suggestions for zsh..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$auto_suggestions_path"
    echo "Installed auto-suggestions for zsh."
  fi
}
