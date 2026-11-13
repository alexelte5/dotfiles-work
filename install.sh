#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")"

echo "→ Pakete"
sudo apt install -y zsh git stow curl wget gpg zoxide
if ! command -v eza >/dev/null; then
  sudo apt install -y eza 2>/dev/null || {
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update && sudo apt install -y eza
  }
fi

echo "→ oh-my-zsh"
if [[ ! -d ~/.oh-my-zsh ]]; then
  RUNZSH=no KEEP_ZSHRC=yes sh -c \
    "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "→ fzf"
if [[ ! -d ~/.fzf ]]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  ~/.fzf/install --bin
fi

echo "→ Plugins"
PLUGINS=zsh/.config/zsh/custom/plugins
mkdir -p "$PLUGINS"
for repo in Aloxaf/fzf-tab zsh-users/zsh-completions zsh-users/zsh-autosuggestions; do
  name=${repo#*/}
  [[ -d $PLUGINS/$name ]] || git clone --depth 1 "https://github.com/$repo" "$PLUGINS/$name"
done

echo "→ Bestehende Configs sichern"
[[ -f ~/.zshrc && ! -L ~/.zshrc ]] && mv ~/.zshrc ~/.zshrc.bak
[[ -d ~/.config/zsh && ! -L ~/.config/zsh ]] && mv ~/.config/zsh ~/.config/zsh.bak

echo "→ Symlinks"
mkdir -p ~/.config
stow -t ~ zsh

echo "→ zsh als Default-Shell"
[[ "$SHELL" == *zsh ]] || chsh -s "$(which zsh)"

echo "✓ Fertig – neues Terminal öffnen. Tipps für WSL stehen in der README."
