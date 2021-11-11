#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest gnupg package from Homebrew"
  echo "   🛠  Configure syncing of the GPG keychain"
}

function symlink_file() {
  local -r filename="$1"
  ln -s "$DOTFILES_BASE_PATH/.gnupg/$filename" "$HOME/.gnupg/$filename"
}

function install() {
  install_homebrew_package "gnupg"

  local -r gpg_config_path="$HOME/.gnupg"

  if [ -d "$gpg_config_path" ]; then
    echo "GPG configuration already exists at $gpg_config_path"
  else
    echo "Symlinking GPG configuration to $DOTFILES_BASE_PATH..."
    mkdir -p "$gpg_config_path"
    chmod -h 700 "$DOTFILES_BASE_PATH/.gnupg"

    symlink_file "crls.d"
    symlink_file "openpgp-revocs.d"
    symlink_file "private-keys-v1.d"
    symlink_file "trustdb.gpg"
  fi
}
