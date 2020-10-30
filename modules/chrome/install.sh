#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs Google Chrome"
}

function install() {
  install_app_from_dmg "https://dl.google.com/chrome/mac/stable/GGRO/googlechrome.dmg" "Google Chrome.app"
}
