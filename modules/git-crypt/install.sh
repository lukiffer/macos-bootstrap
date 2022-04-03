#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest git-crypt from Homebrew"
}

function install() {
  install_homebrew_package "git-crypt"
}
