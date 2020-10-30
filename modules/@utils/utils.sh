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
  local -r environment_override="INSTALL_$(echo "$package_name" | /usr/bin/sed 's/-/_/' | tr '[:lower:]' '[:upper:]')"

  local confirmation="false"

  if [ "$MACOSBS_INSTALL_ALL" == "true" ]; then
    confirmation="true"
  else
    confirmation=$(confirm "$environment_override" "Do you want to install $package_name?")
  fi

  if [ "$confirmation" == "true" ]; then
    echo "Installing homebrew package $package_name..."
    brew install "$package_name"
  else
    echo "Homebrew package $package_name will not be installed."
  fi
}

function get_dropbox_mount_path() {
  if [ -f ~/.dropbox/info.json ]; then
    jq -r '.personal.path' < ~/.dropbox/info.json
  else
    echo >&2 "Could not determine the Dropbox mount path!"
  fi
}
