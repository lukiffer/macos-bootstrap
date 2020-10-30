#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$(dirname "$0")/../../utils/install-homebrew-package.sh"

function install_gnupg() {
  install_homebrew_package "gnupg"
  install_homebrew_package "pass"
}

install_gnupg "$@"
