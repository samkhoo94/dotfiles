# macOS Tips

## Dock

Permanently hide the Dock (effectively disabled):
```bash
defaults write com.apple.dock autohide-delay -float 1000; killall Dock
```

Re-enable:
```bash
defaults delete com.apple.dock autohide-delay; killall Dock
```
