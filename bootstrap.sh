#!/usr/bin/env bash

set -e

SCRIPT_PATH="$(
  cd "$(dirname "${BASH_SOURCE[0]}")"
  pwd -P
)"

function run_module() {
  local -r module_name="$1"
  local -r mutex_path="$PWD/.macosbs-mutex--$module_name"

  echo "Running module $module_name..."

  # Check if a mutex for a module exists; don't run the same module again
  if [ -f "$mutex_path" ]; then
    echo "The module $module_name has already been run and won't be run again."
    return
  fi

  # Run the module with the utilities sourced
  bash -c ". $SCRIPT_PATH/modules/@utils/utils.sh && . $SCRIPT_PATH/modules/$module_name/install.sh"

  # Write a mutex file to prevent duplicate runs of the same module
  touch "$mutex_path"

  # Write a mutex file to the PWD to prevent future runs
  echo "Finished module $module_name."
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
    echo "Please install and login to Dropbox to import settings and other files."
    exit 255
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

  echo "Completed bootstrap sequence."
}

bootstrap "$@"
