#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs Microsoft Remote Desktop from the App Store"
}

function install() {
  echo "Installing Microsoft Remote Desktop..."
  mas install 1295203466
}
