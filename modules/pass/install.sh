#!/usr/bin/env bash

function install_password_store() {
  install_homebrew_package "pass"

  local -r pass_config_path="$HOME/.password-store"
  if [ -d "$pass_config_path" ]; then
    echo "Passwordstore configuration already exists at $pass_config_path"
  else
    echo "Symlinking passwordstore configuration to Dropbox..."

    local -r dropbox_mount_path=$(get_dropbox_mount_path)
    if [ -z "$dropbox_mount_path" ]; then
      exit 1
    fi

    ln -s "$dropbox_mount_path/.password-store" "$pass_config_path"

    echo "Passwordstore config syncing via Dropbox enabled."
  fi
}

install_password_store "$@"
