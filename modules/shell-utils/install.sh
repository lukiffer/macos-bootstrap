#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest bat package from Homebrew"
  echo "   📦  Install the latest coreutils package from Homebrew"
  echo "   📦  Install the latest dos2unix package from Homebrew"
  echo "   📦  Install the latest gnu-sed package from Homebrew"
  echo "   📦  Install the latest ipcalc package from Homebrew"
  echo "   📦  Install the latest jq package from Homebrew"
  echo "   📦  Install the latest netcat package from Homebrew"
  echo "   📦  Install the latest shellcheck package from Homebrew"
  echo "   📦  Install the latest sops package from Homebrew"
  echo "   📦  Install the latest watch package from Homebrew"
}

function install() {
  install_homebrew_package "bat"
  install_homebrew_package "coreutils"
  install_homebrew_package "dos2unix"
  install_homebrew_package "gnu-sed"
  install_homebrew_package "ipcalc"
  install_homebrew_package "jq"
  install_homebrew_package "netcat"
  install_homebrew_package "powershell"
  install_homebrew_package "shellcheck"
  install_homebrew_package "sops"
  install_homebrew_package "watch"
}
