#!/usr/bin/env bash

function describe_actions() {
  echo "   🛠  Install bartender (macbartender.com) application"
}

function install() {
  echo "Downloading Bartender application archive..."
  curl -o- https://www.macbartender.com/Demo/Bartender%203.zip > bartender.zip

  echo "Unzipping the Bartender archive..."
  unzip bartender.zip

  echo "Installing Bartender application..."
  mv Bartender\ 3.app /Applications

  echo "Launching Bartender..."
  open /Applications/Bartender\ 3.app

  echo "Cleaning up..."
  rm -rf __MACOSX
}
