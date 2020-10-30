#!/usr/bin/env bash

set -e

SCRIPT_PATH="$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)"

function run_module() {
  local -r module_name="$1"
  local -r mutex_path="$HOME/.macos-bootstrap/.macosbs-mutex--$module_name"

  # Check if a mutex for a module exists; don't run the same module again
  if [ -f "$mutex_path" ]; then
    echo "The module $module_name has already been run and won't be run again."
    return
  fi

  # Print the module banner
  echo "--------------------------------------------------------------------------------"
  echo " Module: $module_name"
  echo ""
  echo " This module will:"
  bash -c ". $SCRIPT_PATH/modules/$module_name/install.sh && describe_actions"
  echo ""
  echo "--------------------------------------------------------------------------------"

  echo "Do you want to run this module? (y/N)"
  read -r install

  if [ "$install" == "y" ]; then
    # Run the module with the utilities sourced
    bash -c ". $SCRIPT_PATH/modules/@utils/utils.sh && . $SCRIPT_PATH/modules/$module_name/install.sh && install"
  else
    echo "Opted out of module $module_name"
  fi

  # Write a mutex file to prevent duplicate runs of the same module
  touch "$mutex_path"

  echo "Finished module $module_name."
  echo ""
}

function load_environment() {
  if [ -f .macos-bootstrap.env ]; then
    echo "Environment file exists; loading it..."
    env .macos-bootstrap.env
    echo "Environment file loaded to current shell."
  fi
}

function verify_dropbox() {
  echo "Do you want to use Dropbox to store and sync your dotfiles? (y/N)"
  read -r use_dropbox
  if [ "$use_dropbox" == "y" ] && [ ! -f ~/.dropbox/info.json ]; then
    echo "Could not determine the location of the Dropbox mount."
    echo "This could be because Dropbox is not installed or you're not logged in."
    run_module "dropbox"
    echo ""
    echo "You'll need to sign-in to Dropbox, then re-run this script."
    exit 0
  else
    echo "Verified Dropbox mount."
  fi
}

function bootstrap() {
  echo "Running bootstrap sequence..."
  # Load environment file if it exists
  load_environment

  # Verify that Dropbox is installed (optional)
  verify_dropbox

  # Run installer modules in pre-defined order
  # We're installing homebrew first because we'll use it to install GNU versions of commands that we'll use in other modules.
  run_module "homebrew"
  run_module "shell-utils"

  # We're installing bash to allow subsequent modules to use bash 4/5 features.
  run_module "bash"

  # Install OhMyZsh and related shell plugins
  run_module "zsh"
  run_module "zsh-powerline"
  run_module "zsh-auto-suggestions"

  # Install and configure gnupg
  run_module "gnupg"

  # Install and configure passwordstore
  run_module "pass"

  # Install and configure CLI developer tools
  run_module "pre-commit"
  run_module "packer"
  run_module "k8s"

  # Install frameworks and runtimes
  run_module "python"
  run_module "nodejs"
  run_module "go"
  run_module "terraform"

  # Install cloud service provider SDKs and CLI tools
  run_module "aws-cli"
  run_module "az"
  run_module "gcloud"

  # Install applications
  run_module "1password"
  run_module "chrome"
  run_module "docker"
  run_module "iterm"
  run_module "vscode"

  # Configure the macOS dock
  run_module "macos-dock-clear"
  run_module "macos-dock-autohide"

  echo "Completed bootstrap sequence."
}

bootstrap "$@"
