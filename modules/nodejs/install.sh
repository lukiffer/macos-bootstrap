#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install NVM from source"
  echo "   📦  Install NodeJS lts/dubnium (10.x)"
  echo "   📦  Install NodeJS lts/erbium (12.x)"
  echo "   📦  Install NodeJS lts/fermium (14.x)"
  echo "   🛠  Set NodeJS lts/fermium as the default system runtime"
}

function install() {
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

  echo "Loading NVM..."
  export NVM_DIR="$HOME/.nvm"
  # shellcheck disable=SC1090
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

  echo "Installing NodeJS runtimes..."
  nvm install lts/dubnium
  nvm install lts/erbium
  nvm install lts/fermium

  echo "Setting default NodeJS runtime to lts/fermium"
  nvm "alias" default lts/fermium
}
