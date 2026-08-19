#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest Hunspell package from Homebrew"
  echo "   📦  Install the en_US Hunspell dictionary to ~/Library/Spelling"
}

function install() {
  install_homebrew_package "hunspell"

  local -r dictionary_path="$HOME/Library/Spelling"
  local -r dictionary_repo="https://raw.githubusercontent.com/LibreOffice/dictionaries/master/en"

  # Homebrew ships the hunspell binary without any dictionaries; without these
  # hunspell fails with "Can't open affix or dictionary files".
  if [ -f "$dictionary_path/en_US.dic" ]; then
    echo "The en_US Hunspell dictionary is already installed at $dictionary_path."
  else
    echo "Downloading the en_US Hunspell dictionary..."
    mkdir -p "$dictionary_path"
    curl -fsSL "$dictionary_repo/en_US.aff" > "$dictionary_path/en_US.aff"
    curl -fsSL "$dictionary_repo/en_US.dic" > "$dictionary_path/en_US.dic"
    echo "The en_US Hunspell dictionary installed successfully."
  fi
}
