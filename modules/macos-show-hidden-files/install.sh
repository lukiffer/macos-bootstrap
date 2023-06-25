#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Show hidden files in Finder"
}

function install() {
  # Show hidden files in Finder windows
  defaults write com.apple.finder AppleShowAllFiles -bool YES

  # Restart the Finder process
  killall Finder
}
