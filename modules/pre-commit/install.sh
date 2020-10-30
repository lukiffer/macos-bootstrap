#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest pre-commit package from Homebrew"
  echo "   🛠  Configures pre-commit hooks to be installed in all git repos by default"
}

function install() {
  install_homebrew_package "pre-commit"

  echo "Configuring pre-commit hooks to be installed in all repositories..."
  # Configure git to use a template directory
  git config --global init.templateDir ~/.git-template

  # Install pre-commit hooks into the template
  pre-commit init-templatedir ~/.git-template
}
