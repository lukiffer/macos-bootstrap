#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Unlink current python installation"
  echo "   📦  Install the latest pyenv package from Homebrew"
  echo "   📦  Install the latest pipx package from Homebrew"
  echo "   📦  Install latest Python 3 version"
  echo "   🛠  Set the default system runtime"
}

function install() {
  # Unlink current python installation
  brew unlink python
  brew unlink python3

  # Install pyenv
  brew install pyenv

  # Install pipx
  brew install pipx

  # We're using pyenv to list available versions instead of python.org because pyenv isn't always current.
  local -r version=$(pyenv install --list | grep '^[ ]*[0-9]\+\.[0-9]\+\.[0-9]\+$' | sort -rV | head -n 1)

  # Install latest available python version
  pyenv install "$version"

  set -e
  pushd "$HOME"
    pyenv "local" "$version"
  popd
}
