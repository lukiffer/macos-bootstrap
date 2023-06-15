#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install homebrew"
  echo "   📦  Upgrade homebrew packages (optional, recommended)"
}

function install() {
  if hash brew 2>/dev/null; then
    echo "Homebrew is already installed."
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # We'll use the default `.zprofile` to make sure we can use homebrew from a vanilla base install.
    # The assumption is that the preferred config will be symlinked in a later step.
    /opt/homebrew/bin/brew shellenv >> "$HOME/.zprofile"

    # shellcheck disable=SC1091
    source "$HOME/.zprofile"
  fi

  echo "Updating Homebrew..."
  brew update

  local -r upgrade_homebrew_packages=$(confirm \
    "UPGRADE_HOMEBREW_PACKAGES" \
    "Do you want to upgrade all installed homebrew packages (recommended)?")


  if [ "$upgrade_homebrew_packages" == "true" ]; then
    # Upgrade packages to the most current version in case they already exist.
    # We're doing this because Homebrew has a non-zero exit code if a package is already installed but isn't the latest.
    brew upgrade
  fi
}
