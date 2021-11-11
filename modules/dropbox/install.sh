#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install Dropbox"
}

function install() {
  # Get the current version of the Dropbox installer from the redirect header on the download link.
  dropbox_version=$(curl -sIXGET https://www.dropbox.com/download\?plat=mac 2>&1 | grep location | sed -e 's/.*build_no=\(.*\)&plat.*/\1/')

  # Download the offline installer for that version of Dropbox.
  install_app_from_dmg "https://edge.dropboxstatic.com/dbx-releng/client/Dropbox%20$dropbox_version.dmg" "Dropbox.app"
  open /Applications/Dropbox.app
}
