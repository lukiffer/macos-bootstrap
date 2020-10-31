#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the Alfred (alfredapp.com) application"
}

function install() {
  install_app_from_dmg "https://cachefly.alfredapp.com/Alfred_4.2_1180.dmg" "Alfred 4.app"
}
