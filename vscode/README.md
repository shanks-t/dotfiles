# VSCode Configuration

Custom VSCode settings and keybindings designed to maintain unified muscle memory with Neovim.

## Files

- `settings.json` - Editor settings and vim plugin configuration
- `keybindings.json` - Custom keybindings

## Installation

**macOS:**
```bash
ln -sf ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
```

**Linux:**
```bash
ln -sf ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```

Or run `~/.dotfiles/install.sh` to set up all symlinks automatically.

## Syncing Changes

If using symlinks, changes made in VSCode are automatically reflected in this repo.

If not using symlinks, manually copy updated files:
```bash
# macOS
cp ~/Library/Application\ Support/Code/User/settings.json ~/.dotfiles/vscode/
cp ~/Library/Application\ Support/Code/User/keybindings.json ~/.dotfiles/vscode/
```

## Philosophy

We maintain unified muscle memory across editors by:
1. Designing Neovim keybindings based on community standards
2. Syncing VSCode to match Neovim where practical
3. Documenting exceptions where tools differ
