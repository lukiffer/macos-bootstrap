#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install 1Password"
  echo "   📦  Install 1Password CLI"
}

function install() {
  echo "Downloading 1Password installer package..."
  curl -o- https://downloads.1password.com/mac/1Password.pkg > "1Password.pkg"

  echo "Installing 1Password application..."
  sudo installer -pkg "1Password.pkg" -target /

  echo "Removing 1Password installer..."
  rm "1Password.pkg"

  echo "Installing 1Password CLI..."
  brew install --cask 1password/tap/1password-cli
}
