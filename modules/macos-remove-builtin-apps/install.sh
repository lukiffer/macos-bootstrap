#!/usr/bin/env bash

function describe_actions() {
  echo "   ❌  Uninstall GarageBand"
  echo "   ❌  Uninstall Keynote"
  echo "   ❌  Uninstall Numbers"
  echo "   ❌  Uninstall Pages"
  echo "   ❌  Uninstall iMovie"
}

function install() {
  # Uninstall unwanted bloatware
  sudo rm -rf /Applications/GarageBand.app/
  sudo rm -rf /Applications/Keynote.app/
  sudo rm -rf /Applications/Numbers.app/
  sudo rm -rf /Applications/Pages.app/
  sudo rm -rf /Applications/iMovie.app/
}
