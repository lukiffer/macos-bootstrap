#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install 1Password"
}

function install() {
  install_app_from_dmg "https://app-updates.agilebits.com/download/OPM7" "1Password 7.app"
}
