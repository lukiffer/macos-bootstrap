#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest docker package from Homebrew"
  echo "   📦  Install the latest docker-compose package from Homebrew"
  echo "   📦  Install the latest docker-machine package from Homebrew"
  echo "   📦  Install the latest xhyve package from Homebrew"
  echo "   📦  Install the latest docker-machine-driver-xhyve package from Homebrew"
}

function install() {
  install_homebrew_package "docker"
  install_homebrew_package "docker-compose"
  install_homebrew_package "docker-machine"
  install_homebrew_package "xhyve"
  install_homebrew_package "docker-machine-driver-xhyve"
}
