#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install iTerm2"
  echo "   🛠  Configure syncing of iTerm configuration via Dropbox"
}

function install() {
  local -r iterm_path="/Applications/iTerm.app"
  if [ -d "$iterm_path" ]; then
    echo "iTerm2 is already installed at $iterm_path"
  else
    echo "Installing iTerm2..."
    brew cask install iterm2
    echo "iTerm2 installed."

    echo "Configuring iTerm preferences syncing via Dropbox..."
    defaults write com.googlecode.iterm2 PrefsCustomFolder "$HOME/Dropbox/Settings/iTerm2"
    echo "Syncing of iTerm preferences enabled."
  fi
}
