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

  local -r version=$(curl -sSL https://www.python.org/ftp/python/ | sed -n 's!.*href="\([0-9]\+\.[0-9]\+\.[0-9]\+\)/".*!\1!p' | sort -rV | head -n 1)

  # Install python 3.8.6
  pyenv install "$version"

  set -e
  pushd "$HOME"
    pyenv "local" "$version"
  popd
}
