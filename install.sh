#!/bin/bash

# Dotfiles installation script
# Creates symlinks from dotfiles repo to their expected locations

set -e

DOTFILES_DIR="$HOME/.dotfiles"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Create symlink with backup of existing file
create_symlink() {
    local source="$1"
    local target="$2"
    local target_dir=$(dirname "$target")

    # Create target directory if it doesn't exist
    if [ ! -d "$target_dir" ]; then
        info "Creating directory: $target_dir"
        mkdir -p "$target_dir"
    fi

    # Check if target already exists
    if [ -L "$target" ]; then
        # It's already a symlink
        local current_link=$(readlink "$target")
        if [ "$current_link" = "$source" ]; then
            info "Already linked: $target"
            return 0
        else
            warn "Updating symlink: $target (was pointing to $current_link)"
            rm "$target"
        fi
    elif [ -e "$target" ]; then
        # It's a regular file, back it up
        local backup="${target}.backup.$(date +%Y%m%d%H%M%S)"
        warn "Backing up existing file: $target → $backup"
        mv "$target" "$backup"
    fi

    # Create the symlink
    ln -s "$source" "$target"
    info "Linked: $target → $source"
}

echo ""
echo "================================"
echo "  Dotfiles Installation Script"
echo "================================"
echo ""

# Verify dotfiles directory exists
if [ ! -d "$DOTFILES_DIR" ]; then
    error "Dotfiles directory not found: $DOTFILES_DIR"
    exit 1
fi

# Detect OS
OS="$(uname -s)"
info "Detected OS: $OS"
echo ""

# --- Ghostty ---
echo "--- Ghostty ---"
if [ -f "$DOTFILES_DIR/ghostty/config" ]; then
    create_symlink "$DOTFILES_DIR/ghostty/config" "$HOME/.config/ghostty/config"
else
    warn "Ghostty config not found, skipping"
fi
echo ""

# --- VSCode ---
echo "--- VSCode ---"
if [ -d "$DOTFILES_DIR/vscode" ]; then
    case "$OS" in
        Darwin)
            VSCODE_USER_DIR="$HOME/Library/Application Support/Code/User"
            ;;
        Linux)
            VSCODE_USER_DIR="$HOME/.config/Code/User"
            ;;
        *)
            warn "Unknown OS for VSCode config, skipping"
            VSCODE_USER_DIR=""
            ;;
    esac

    if [ -n "$VSCODE_USER_DIR" ]; then
        if [ -f "$DOTFILES_DIR/vscode/settings.json" ]; then
            create_symlink "$DOTFILES_DIR/vscode/settings.json" "$VSCODE_USER_DIR/settings.json"
        fi
        if [ -f "$DOTFILES_DIR/vscode/keybindings.json" ]; then
            create_symlink "$DOTFILES_DIR/vscode/keybindings.json" "$VSCODE_USER_DIR/keybindings.json"
        fi
    fi
else
    warn "VSCode config not found, skipping"
fi
echo ""

# --- Raycast ---
echo "--- Raycast ---"
if [ -f "$DOTFILES_DIR/raycast/config.rayconfig" ]; then
    info "Raycast config found at: $DOTFILES_DIR/raycast/config.rayconfig"
    info "To import: Open Raycast → Settings → Advanced → Import"
    info "Raycast does not support symlinks - manual import required"
else
    warn "Raycast config not found"
fi
echo ""

# --- Summary ---
echo "================================"
echo "  Installation Complete"
echo "================================"
echo ""
info "Symlinks created successfully!"
echo ""
echo "Next steps:"
echo "  1. Restart terminals for Ghostty changes"
echo "  2. Restart VSCode for settings changes"
echo "  3. Import Raycast config manually (Settings → Advanced → Import)"
echo ""
