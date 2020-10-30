#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$(dirname "$0")/../../utils/install-homebrew-package.sh"

function install_bash() {
  install_homebrew_package "bash"
}

install_bash "$@"
