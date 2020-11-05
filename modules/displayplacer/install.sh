#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Add the jakehilborn/jakehilborn tap to Homebrew"
  echo "   📦  Install the latest jakehilborn/displayplacer package from Homebrew"
}

function install() {
  brew tap jakehilborn/jakehilborn
  brew install displayplacer
}
