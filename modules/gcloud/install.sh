#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs the latest google-cloud-sdk package from Homebrew"
}

function install() {
  brew cask install "google-cloud-sdk"
}
