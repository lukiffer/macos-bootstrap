#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Unlinks current python installation"
  echo "   📦  Installs the latest pyenv package from Homebrew"
  echo "   📦  Installs python 3.8.6 (AWS and GCP serverless supported runtime)"
  echo "   🛠  Sets python 3.8.6 as the default system runtime"
}

function install() {
  # Unlink current python installation
  brew unlink python
  brew unlink python3

  # Install pyenv
  brew install pyenv

  # Install python 3.8.6
  pyenv install 3.8.6

  set -e
  pushd "$HOME"
    pyenv "local" 3.8.6
  popd
}
