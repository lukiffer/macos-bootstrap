#!/usr/bin/env bash

REPOSITORY_URL="https://github.com/lukiffer/macos-bootstrap.git"
REPOSITORY_PATH="$HOME/.macos-bootstrap"

function install_updates() {
  echo "Installing macOS updates..."
  sudo softwareupdate --install --all
  echo "Finished installing macOS updates."
}

function install_command_line_tools() {
  echo "Checking whether macOS command line tools are installed..."

  if xcode-select --print-path &> /dev/null; then
    echo "Command Line Tools are already installed."
  else
    echo "Command Line Tools are not yet installed. Installing..."
    # Source: https://apple.stackexchange.com/a/195963/35661
    touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
    local -r product=$(softwareupdate --list | grep "\*.*Command Line" | head -n 1 | awk -F": " '{print $2}' | xargs)
    sudo softwareupdate --install "$product" --verbose
    echo "Finished installing macOS Command Line Tools."
  fi
}

function install_rosetta() {
  processor=$(/usr/sbin/sysctl -n machdep.cpu.brand_string | grep -o "Intel")
  if [[ -n "$processor" ]]; then
    echo "$processor processor installed. Skipping Rosetta installation."
  else
    if /usr/bin/pgrep oahd >/dev/null 2>&1; then
      echo "Rosetta is already installed and running."
    else
      /usr/sbin/softwareupdate --install-rosetta --agree-to-license
      echo "Rosetta has been successfully installed."
    fi
  fi
}

function clone_repository() {
  echo "Cloning bootstrap repository from GitHub..."
  git clone "$REPOSITORY_URL" "$REPOSITORY_PATH"
  echo "Finished cloning the GitHub repository."
}

function run_bootstrap() {
  echo "Running the bootstrap script..."
  set -e
  pushd ~/.macos-bootstrap/
    ./bootstrap.sh
  popd
}

function init() {
  install_updates
  install_command_line_tools
  install_rosetta
  clone_repository
  run_bootstrap
}

init "$@"
