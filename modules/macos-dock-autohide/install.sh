#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Configure the macOS dock to auto-hide"
}

function install() {
  osascript -e 'tell application "System Events" to set the autohide of the dock preferences to true'
}
