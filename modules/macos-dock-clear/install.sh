#!/usr/bin/env bash

function describe_actions() {
  echo "   ❌  Remove all persistent applications from the macOS dock"
  echo "   ❌  Remove all recent applications from the macOS dock"
}

function install() {
  # Remove all persistent apps from the dock
  defaults delete com.apple.dock persistent-apps

  # Remove all recent apps from the dock
  defaults delete com.apple.dock recent-apps

  # Restart the dock process
  killall Dock
}
