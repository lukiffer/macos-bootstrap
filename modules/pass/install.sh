#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest pass package from Homebrew"
  echo "   🛠  Configure syncing of the passwordstore database"
}

function install() {
  install_homebrew_package "pass"

  local -r pass_config_path="$HOME/.password-store"
  if [ -d "$pass_config_path" ]; then
    echo "Passwordstore configuration already exists at $pass_config_path"
  else
    echo "Symlinking passwordstore configuration to $DOTFILES_BASE_PATH..."
    ln -s "$DOTFILES_BASE_PATH/.password-store" "$pass_config_path"
  fi
}
