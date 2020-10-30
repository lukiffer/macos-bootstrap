#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$(dirname "$0")/../../utils/install-homebrew-package.sh"

function install_shell_utils() {
  install_homebrew_package "bat"
  install_homebrew_package "dos2unix"
  install_homebrew_package "gnu-sed"
  install_homebrew_package "ipcalc"
  install_homebrew_package "jq"
  install_homebrew_package "netcat"
  install_homebrew_package "rpm"
}

install_shell_utils "$@"
