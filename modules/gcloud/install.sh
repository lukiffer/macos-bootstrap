#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest google-cloud-sdk package from Homebrew"
}

function install() {
  brew install --cask "google-cloud-sdk"
}
