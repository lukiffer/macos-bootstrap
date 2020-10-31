#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs the latest mas package from Homebrew"
}

function install() {
  echo "Installing Mac App Store (mas) CLI..."
  install_homebrew_package "mas"
}
