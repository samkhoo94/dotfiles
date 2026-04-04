# Dotfiles

Personal dotfiles for macOS, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## How Stow Works

Each top-level directory is a Stow package. Files inside mirror the path they should appear at relative to `$HOME`. For example:

```
nvim/.config/nvim/init.lua  →  ~/.config/nvim/init.lua
zsh/.zshrc                  →  ~/.zshrc
```

From the repo root:
```bash
stow <package>    # symlink a package
stow -D <package> # remove a package's symlinks
```

## Packages

| Package | Purpose |
|---|---|
| `zsh/` | Zsh (Oh-My-Zsh, Powerlevel10k, FZF, Zoxide, aliases) |
| `nvim/` | Neovim — primary config (LazyVim-based) |
| `KickstartNvim/` | Neovim — alternative Kickstart-based config |
| `tmux/` | Tmux (prefix: `Ctrl+S`, Catppuccin theme) |
| `aerospace/` | macOS window tiling manager |
| `alacritty/` | Terminal emulator (macOS) |
| `kitty/` | Terminal emulator (macOS) |
| `images/` | Mac icons — not a Stow package |
| `wallpapers/` | Desktop wallpapers — excluded from Stow |

## Conventions

- **New tool**: create `<tool>/` at repo root, mirror the XDG/home path inside it
- **Neovim plugins**: add files to `nvim/.config/nvim/lua/plugins/`
- **Font**: ShureTechMono Nerd Font used across all terminals
- **Do not commit**: `lazy-lock.json`, `.DS_Store` (both gitignored)

## Cautions

- Preserve the Stow directory structure — paths must exactly mirror where they live under `$HOME`
- `.stow-local-ignore` excludes `wallpapers/`, `images/`, `.git`, `README.md` from symlinking
- The `nvim/` config is LazyVim-based — don't add bare plugin specs that conflict with LazyVim defaults
- `aerospace/`, `alacritty/`, and `kitty/` are macOS-only
