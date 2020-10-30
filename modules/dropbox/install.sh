#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs Dropbox"
}

function install() {
  install_app_from_dmg "https://www.dropbox.com/download?os=mac" "Dropbox.app"
}
