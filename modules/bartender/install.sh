#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Install bartender (macbartender.com) application"
}

function install() {
  echo "Finding latest version..."
  local -r url=$(curl -sSL https://www.macbartender.com/ |  grep 'id="downloadButtonNav"' | cut -d'"' -f 2)

  echo "Installing Bartender application..."
  install_app_from_dmg "$url" "Bartender 4.app"
}
