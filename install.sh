#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="$HOME"

is_termux() {
  [[ "${PREFIX:-}" == "/data/data/com.termux/files/usr" ]] || [[ -d /data/data/com.termux/files/home ]]
}

link() {
  src="$1"; dst="$2"
  mkdir -p "$(dirname "$dst")"
  ln -sf "$src" "$dst"
  echo "→ $dst → $src"
}

if is_termux; then
  echo "Installing Termux dotfiles..."
  link "$REPO_DIR/termux/tmux.conf" "$DEST/.tmux.conf"
  link "$REPO_DIR/termux/zshrc"     "$DEST/.zshrc"
  link "$REPO_DIR/termux/vimrc"     "$DEST/.vimrc"

  # extras
  pkg update -y || true
  pkg install -y zsh tmux vim git termux-api || true

  # make zsh default on new sessions
  grep -q 'exec zsh' "$HOME/.bashrc" 2>/dev/null || echo 'command -v zsh >/dev/null && exec zsh' >> "$HOME/.bashrc"
else
  echo "Installing base dotfiles..."
  link "$REPO_DIR/tmux.conf" "$DEST/.tmux.conf"
  link "$REPO_DIR/zshrc"     "$DEST/.zshrc"
  link "$REPO_DIR/vimrc"     "$DEST/.vimrc"
fi

echo "Done."
