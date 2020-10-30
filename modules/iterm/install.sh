#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install iTerm2"
}

function install() {
  local -r iterm_path="/Applications/iTerm.app"
  if [ -d "$iterm_path" ]; then
    echo "iTerm2 is already installed at $iterm_path"
  else
    echo "Installing iTerm2..."
    brew cask install iterm2
  fi
}
