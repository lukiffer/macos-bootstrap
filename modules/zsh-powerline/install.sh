#!/usr/bin/env bash

function describe_actions() {
  echo "   📦  Install the powerline (powerlevel10k) plugin from source"
  echo "   📦  Install the patched fonts for powerline"
}

function install() {
  local -r powerline_path="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
  if [ -d "$powerline_path" ]; then
    echo "Powerline is already installed at $powerline_path."
  else
    echo "Installing powerline (powerlevel10k)..."
    git clone https://github.com/romkatv/powerlevel10k.git "$powerline_path"
    echo "Powerline (powerlevel10k) installed successfully."
  fi

  local -r font_path="$HOME/Library/Fonts"
  if [ -f "$font_path/MesloLGS NF Regular.ttf" ]; then
    echo "Patched fonts for Powerline already installed."
  else
    echo "Patched fonts for Powerline are missing."
    echo "Installing patched fonts..."
    local -r font_repo="https://github.com/romkatv/dotfiles-public/raw/master/.local/share/fonts/NerdFonts"
    curl -L "$font_repo/MesloLGS%20NF%20Regular.ttf" > "$font_path/MesloLGS NF Regular.ttf"
    curl -L "$font_repo/MesloLGS%20NF%20Bold.ttf" > "$font_path/MesloLGS NF Bold.ttf"
    curl -L "$font_repo/MesloLGS%20NF%20Italic.ttf" > "$font_path/MesloLGS NF Italic.ttf"
    curl -L "$font_repo/MesloLGS%20NF%20Bold%20Italic.ttf" > "$font_path/MesloLGS NF Bold Italic.ttf"
    echo "Powerline fonts successfully installed."
  fi
}
