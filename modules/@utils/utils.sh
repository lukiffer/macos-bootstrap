#!/usr/bin/env bash

function confirm() {
  local -r environment_override="MACOSBS__$1"
  local -r prompt="$2"
  local result="false"

  if [ -z "${!environment_override}" ]; then
    # No preference was specified in the environment
    echo >&2 "$prompt (y/N)"
    read -r confirm
    if [ "$confirm" == "y" ]; then
      result="true"
    else
      result="false"
    fi
  else
    result="$environment_override"
  fi

  echo "$result"
}

function install_homebrew_package() {
  local -r package_name="$1"
  echo "Installing homebrew package $package_name..."
  brew install "$package_name"
}

function get_dropbox_mount_path() {
  if [ -f ~/.dropbox/info.json ]; then
    jq -r '.personal.path' < ~/.dropbox/info.json
  else
    echo >&2 "Could not determine the Dropbox mount path!"
  fi
}

function install_app_from_dmg() {
  local -r dmg_url="$1"
  local -r app_name="$2"
  local -r mount="$HOME/.install"

  echo "Downloading DMG from $dmg_url..."
  curl -fsSL "$dmg_url" > install.dmg

  echo "Mounting DMG..."
  hdiutil attach install.dmg -mountpoint "$mount"

  echo "Copying application to /Applications..."
  cp -R "$mount/$app_name" /Applications/

  echo "Unmounting DMG..."
  hdiutil detach "$mount"

  echo "Removing DMG..."
  rm -rf install.dmg
}
