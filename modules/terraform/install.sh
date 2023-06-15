#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest terragrunt package from Homebrew"
  echo "   🛠  Unlink Homebrew-managed terraform binary"
  echo "   📦  Install the latest tfenv package from Homebrew"
  echo "   📦  Install the latest tfsec package from Homebrew"
  echo "   📦  Install the latest tflint package from Homebrew"
  echo "   📦  Install the latest Terraform version via tfenv"
  echo "   🛠  Configure tfenv to use the latest version by default"
}

function install() {
  install_homebrew_package "terragrunt"

  brew unlink terraform

  install_homebrew_package "tfenv"
  install_homebrew_package "tfsec"
  install_homebrew_package "tflint"

  tfenv install latest
  tfenv use latest
}
