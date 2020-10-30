#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Installs the latest azure-cli package from Homebrew"
}

function install() {
  install_homebrew_package "azure-cli"
}
