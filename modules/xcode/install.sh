#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs XCode from the App Store"
}

function install() {
  echo "Installing XCode..."
  mas install 497799835
}
