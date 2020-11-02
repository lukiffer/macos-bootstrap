#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Configure syncing of SSH keys and config via Dropbox"
  echo "   🛠  Configure ssh-agent to use the macOS keychain to store SSH key passphrases"
}

function install() {
  echo "Symlinking .ssh folder to Dropbox..."
  local -r dropbox_mount_path=$(get_dropbox_mount_path)
  if [ -z "$dropbox_mount_path" ]; then
    exit 1
  fi

  ln -s "$dropbox_mount_path/.ssh/" "$HOME/.ssh"

  echo "Configuring ssh-agent to use macOS keychain..."
  ssh-add -K
}
