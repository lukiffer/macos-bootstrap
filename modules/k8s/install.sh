#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest kubernetes-cli package from Homebrew"
  echo "   📦  Install the latest helm package from Homebrew"
}

function install() {
  install_homebrew_package "kubernetes-cli"
  install_homebrew_package "helm"
}
