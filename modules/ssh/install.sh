#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Configure syncing of SSH keys and config"
  echo "   🛠  Configure ssh-agent to use the macOS keychain to store SSH key passphrases"
}

function install() {
  echo "Symlinking .ssh folder to $DOTFILES_BASE_PATH..."
  ln -s "$DOTFILES_BASE_PATH/.ssh/" "$HOME/.ssh"

  echo "Configuring ssh-agent to use macOS keychain..."
  ssh-add -K
}
