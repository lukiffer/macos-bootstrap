#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest packer package from Homebrew"
}

function install() {
  install_homebrew_package "packer"
}
