#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest Helm CLI from Homebrew"
}

function install() {
  install_homebrew_package "helm"
}
