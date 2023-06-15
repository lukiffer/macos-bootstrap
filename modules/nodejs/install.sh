#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install NVM from source"
  echo "   📦  Install latest stable runtime"
    echo "   🛠  Set latest stable as the default runtime"
}

function install() {
  echo "Finding latest installer version..."
  local -r version=$(curl -sSL https://api.github.com/repos/nvm-sh/nvm/releases/latest | jq -r .name)

  echo "Installing NVM..."
  curl -o- "https://raw.githubusercontent.com/nvm-sh/nvm/$version/install.sh" | bash

  echo "Loading NVM..."
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  echo "Installing latest stable runtime..."
  nvm install stable

  echo "Setting default NodeJS runtime..."
  nvm "alias" default stable
}
