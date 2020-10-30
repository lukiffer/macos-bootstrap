#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs NVM from source"
  echo "   📦  Installs NodeJS lts/dubnium (10.x)"
  echo "   📦  Installs NodeJS lts/erbium (12.x)"
  echo "   📦  Installs NodeJS lts/fermium (14.x)"
  echo "   🛠  Sets NodeJS lts/fermium as the default system runtime"
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
