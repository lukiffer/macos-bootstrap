#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest Oh My Zsh from source"
  echo "   🛠  Set appropriate permissions on /usr/local/share/zsh"
  echo "   ❌  Remove existing .zshrc configuration"
  echo "   🛠  Configure syncing of .zshrc via Dropbox"
}

function install() {
  echo "Installing Oh My Zsh..."
  # Prevent installer from starting a zsh subshell inside the installer
  export RUNZSH="no"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "Oh My Zsh installed."

  echo "Updating permissions on /usr/local/share/zsh..."
  # Restrict permissions for auto-completions
  chmod -R 755 /usr/local/share/zsh
  echo "Permissions updated."

  echo "Removing existing .zshrc..."
  rm -rf "$HOME/.zshrc"
  echo "Existing .zshrc removed."

  echo "Symlinking .zshrc to Dropbox"
  local -r dropbox_mount_path=$(get_dropbox_mount_path)
  if [ -z "$dropbox_mount_path" ]; then
    exit 1
  fi

  ln -s "$dropbox_mount_path/.zshrc" "$HOME/.zshrc"
  chmod -h 600 "$dropbox_mount_path/.zshrc"
  echo ".zshrc syncing via Dropbox enabled."
}
