#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Disable natural scrolling"
}

function install() {
  defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
}
