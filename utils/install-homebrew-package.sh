#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$(dirname "$0")/../../utils/confirm-action.sh"

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
