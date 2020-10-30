#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install Dropbox"
}

function install() {
  install_app_from_dmg "https://edge.dropboxstatic.com/dbx-releng/client/Dropbox%20108.4.453.dmg" "Dropbox.app"
  open /Applications/Dropbox.app
}
