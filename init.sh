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
    echo "Finishing installing macOS Command Line Tools."
  fi
}

function clone_repository() {
  echo "Cloning bootstrap repository from GitHub..."
  git clone "$REPOSITORY_URL" "$REPOSITORY_PATH"
  echo "Finished cloning the GitHub repository."
}

function run_bootstrap() {
  echo "Running the bootstrap script..."
  bash -c ~/.macos-bootstrap/bootstrap.sh
}

function init() {
  install_updates
  install_command_line_tools
  clone_repository
  run_bootstrap
}

init "$@"
