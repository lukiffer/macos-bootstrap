#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the latest Oh My Zsh from source"
  echo "   🛠  Set appropriate permissions on /usr/local/share/zsh"
  echo "   ❌  Remove existing .zshrc configuration"
  echo "   🛠  Configure syncing of .zshrc"
}

function install() {
  echo "Installing Oh My Zsh..."
  # Prevent installer from starting a zsh subshell inside the installer
  export RUNZSH="no"
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  echo "Oh My Zsh installed."

  echo "Updating permissions on /usr/local/share/zsh..."
  # Restrict permissions for auto-completions
  chmod -R 755 /usr/local/share/zsh
  echo "Permissions updated."

  echo "Removing existing .zshrc..."
  rm -rf "$HOME/.zshrc"
  echo "Existing .zshrc removed."

  echo "Symlinking .zshrc to $DOTFILES_BASE_PATH"
  ln -s "$DOTFILES_BASE_PATH/.zshrc" "$HOME/.zshrc"
  chmod -h 600 "$DOTFILES_BASE_PATH/.zshrc"
}
