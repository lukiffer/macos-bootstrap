#!/usr/bin/env bash

function install_gnupg() {
  install_homebrew_package "gnupg"

  local -r gpg_config_path="$HOME/.gnupg"
  if [ -d "$gpg_config_path" ]; then
    echo "GPG configuration already exists at $gpg_config_path"
  else
    echo "Symlinking GPG configuration to Dropbox..."

    local -r dropbox_mount_path=$(get_dropbox_mount_path)
    if [ -z "$dropbox_mount_path" ]; then
      exit 1
    fi

    ln -s "$dropbox_mount_path/.gnupg" "$gpg_config_path"
    chmod -h 700 "$dropbox_mount_path/.gnupg"
    echo "GPG config syncing via Dropbox enabled."
  fi
}

install_gnupg "$@"
