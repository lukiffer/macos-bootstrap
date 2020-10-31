#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Configure syncing of .gitconfig via Dropbox"
}

function install() {
  echo "Symlinking .gitconfig from Dropbox..."
  ln -s "$HOME/Dropbox/.gitconfig" "$HOME/.gitconfig"
  echo "Symlink created."
}
