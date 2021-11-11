#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Configure syncing of .gitconfig"
}

function install() {
  echo "Symlinking .gitconfig from $DOTFILES_BASE_PATH..."
  ln -s "$DOTFILES_BASE_PATH/.gitconfig" "$HOME/.gitconfig"
  echo "Symlink created."
}
