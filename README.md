# Dotfiles

Personal configuration files for syncing development environment across machines.

## Overview

| Tool | Description | Config Location |
|------|-------------|-----------------|
| **Ghostty** | GPU-accelerated terminal emulator | `ghostty/config` |
| **Raycast** | Launcher and productivity tool | `raycast/config.rayconfig` |
| **VSCode** | Editor settings and keybindings | `vscode/` |
| **Neovim** | Editor config and plugins | `nvim/` |

## Directory Structure

```
~/.dotfiles/
├── README.md
├── install.sh              # Symlink setup script
├── ghostty/
│   └── config              # Terminal theme, opacity, keybinds
├── raycast/
│   └── config.rayconfig    # Raycast settings export
├── nvim/                   # Neovim config (symlinked to ~/.config/nvim)
└── vscode/
    ├── settings.json       # Editor settings
    └── keybindings.json    # Custom keybindings
```

## Installation

### Quick Setup

```bash
# Clone the repo
git clone https://github.com/treyshanks/dotfiles.git ~/.dotfiles

# Run the install script
cd ~/.dotfiles
./install.sh
```

### Manual Symlinks

If you prefer to set up symlinks manually:

**Ghostty:**
```bash
mkdir -p ~/.config/ghostty
ln -sf ~/.dotfiles/ghostty/config ~/.config/ghostty/config
```

**Raycast:**
```bash
# Raycast imports via Settings → Advanced → Import/Export
# Open Raycast, go to Settings → Advanced → Import
# Select: ~/.dotfiles/raycast/config.rayconfig
```

**Neovim:**
```bash
ln -sf ~/.dotfiles/nvim ~/.config/nvim
```

**VSCode:**
```bash
# macOS
ln -sf ~/.dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# Linux
ln -sf ~/.dotfiles/vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/keybindings.json
```

## Syncing Changes

### Updating Dotfiles from Current Machine

When you make changes to configs on your machine and want to save them:

**Ghostty** - Edit `~/.dotfiles/ghostty/config` directly (it's symlinked)

**Raycast:**
```bash
# Export from Raycast: Settings → Advanced → Export
# Save to: ~/.dotfiles/raycast/config.rayconfig
```

**Neovim** - Edit `~/.dotfiles/nvim` directly (it's symlinked)

**VSCode** - If symlinked, changes are automatic. Otherwise:
```bash
cp ~/Library/Application\ Support/Code/User/settings.json ~/.dotfiles/vscode/
cp ~/Library/Application\ Support/Code/User/keybindings.json ~/.dotfiles/vscode/
```

Then commit and push:
```bash
cd ~/.dotfiles
git add -A
git commit -m "Update configs"
git push
```

### Pulling Changes to Another Machine

```bash
cd ~/.dotfiles
git pull
# Symlinks automatically reflect new content
# For Raycast: re-import the config file
```

## Config Details

### Ghostty

- **Theme:** Catppuccin Frappe
- **Transparency:** 80% opacity with blur
- **Padding:** 10px
- **Keybinds:** Split navigation with `ctrl+alt+super+shift` + `h/j/k/l`

### VSCode

- Vim mode enabled with custom mappings
- Unified keybindings designed to match Neovim muscle memory
- See `vscode/` for full configuration

### Raycast

- Exported settings including:
  - Extensions and their configurations
  - Hotkeys and aliases
  - Window management preferences
  - AI settings

## Related Repositories

- **[nvim](https://github.com/treyshanks/nvim)** - Neovim configuration origin (now tracked in `nvim/`)

## Verification

Check that symlinks are working:

```bash
# Should show symlinks pointing to ~/.dotfiles/
ls -la ~/.config/ghostty/config
ls -la ~/.config/nvim
ls -la ~/Library/Application\ Support/Code/User/settings.json
```

---

**Maintained by:** Trey Shanks
