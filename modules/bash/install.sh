#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest bash from Homebrew"
}

function install() {
  install_homebrew_package "bash"
}
