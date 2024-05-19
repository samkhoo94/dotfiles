# DOTFILES FOR MACOS

Managed With [GNU Stow](https://www.gnu.org/software/stow/)

<hr>

Permanently Disable Dock
```bash
defaults write com.apple.dock autohide-delay -float 1000; killall Dock
```

Re-enable Dock
```bash
defaults delete com.apple.dock autohide-delay; killall Dock
```

<hr>

### FONT

ShureTechMono Nerd Font ( AKA ShareTech )

