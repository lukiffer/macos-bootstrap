#!/usr/bin/env bash

function install_zsh_auto_suggestions() {
  local -r auto_suggestions_path="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"
  if [ -d "$auto_suggestions_path" ]; then
    echo "Auto-suggestions for zsh already installed."
  else
    echo "Installing auto-suggestions for zsh..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$auto_suggestions_path"
    echo "Installed auto-suggestions for zsh."
  fi
}

install_zsh_auto_suggestions "$@"
