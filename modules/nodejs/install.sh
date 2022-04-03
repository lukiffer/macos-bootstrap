#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install NVM from source"
  echo "   📦  Install NodeJS lts/fermium (14.x)"
  echo "   📦  Install NodeJS lts/gallium (16.x)"
  echo "   🛠  Set NodeJS lts/gallium as the default system runtime"
}

function install() {
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

  echo "Loading NVM..."
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1091
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  echo "Installing NodeJS runtimes..."
  nvm install lts/fermium
  nvm install lts/gallium

  echo "Setting default NodeJS runtime to lts/gallium"
  nvm "alias" default lts/gallium
}
