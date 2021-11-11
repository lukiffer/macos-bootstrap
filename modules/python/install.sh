#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Unlink current python installation"
  echo "   📦  Install the latest pyenv package from Homebrew"
  echo "   📦  Install the latest pipx package from Homebrew"
  echo "   📦  Install python 3.8.6 (AWS and GCP serverless supported runtime)"
  echo "   🛠  Set python 3.8.6 as the default system runtime"
}

function install() {
  # Unlink current python installation
  brew unlink python
  brew unlink python3

  # Install pyenv
  brew install pyenv

  # Install pipx
  brew install pipx

  # Install python 3.8.6
  pyenv install 3.8.6

  set -e
  pushd "$HOME"
    pyenv "local" 3.8.6
  popd
}
