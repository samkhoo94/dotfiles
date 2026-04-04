# Dotfiles

Personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Packages

| Package | Purpose |
|---|---|
| `zsh/` | Zsh (Oh-My-Zsh, Powerlevel10k, FZF, Zoxide, aliases) |
| `nvim/` | Neovim — primary config (LazyVim-based) |
| `tmux/` | Tmux (prefix: `Ctrl+S`, Catppuccin theme) |
| `aerospace/` | macOS window tiling manager |
| `alacritty/` | Terminal emulator |
| `kitty/` | Terminal emulator |

## Installation

```bash
git clone --recurse-submodules git@github.com:samkhoo94/dotfiles.git ~/dotfiles
cd ~/dotfiles
```

Symlink a package:

```bash
stow <package>   # e.g. stow zsh
```

This mirrors the package's directory structure under `$HOME`. For example, `zsh/.zshrc` → `~/.zshrc`.

### Prerequisites

```bash
brew install stow
```

## Font

[ShureTechMono Nerd Font](https://www.nerdfonts.com/) used across all terminals.
