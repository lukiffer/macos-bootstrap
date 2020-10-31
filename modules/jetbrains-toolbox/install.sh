#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the JetBrains Toolbox (jetbrains.com) application"
}

function install() {
  install_app_from_dmg "https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.18.7455.dmg" "JetBrains Toolbox.app"
}
