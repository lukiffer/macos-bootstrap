#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs Dropbox"
}

function install() {
  install_app_from_dmg "https://edge.dropboxstatic.com/dbx-releng/client/Dropbox%20108.4.453.dmg" "Dropbox.app"
}
