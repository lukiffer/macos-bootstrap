#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs Slack from the App Store"
}

function install() {
  echo "Installing Slack..."
  mas install 803453959
}
