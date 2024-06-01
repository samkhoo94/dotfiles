# DOTFILES FOR ARCH / MACOS



This repository contains my personal dotfiles, which are configurations for various command-line tools and applications. I manage these dotfiles using [GNU Stow](https://www.gnu.org/software/stow/), a symlink farm manager.

## Usage

### Prerequisites

Before using these dotfiles, you need to have GNU Stow installed. You can install it on most Unix-like systems using your package manager:

```bash
# On Arch Linux
sudo pacman -S stow

# On Debian/Ubuntu
sudo apt-get install stow

# On Fedora
sudo dnf install stow

# On macOS (using Homebrew)
brew install stow
```

### Installation

To use these dotfiles, clone this repository into your home directory:

```bash
git clone https://github.com/yourusername/dotfiles.git ~/.dotfiles
```

Then, navigate to the cloned directory:

```bash
cd ~/.dotfiles
```

Finally, use GNU Stow to symlink the desired dotfiles into your home directory. For example, to symlink the `zsh` configuration:

```zsh
stow zsh
```

This will create symlinks from `~/.dotfiles/zsh/.zshrc` to `~/.zshrc`.

Repeat this process for any other configurations you want to use.

### Adding New Configurations

To add new configurations, simply create a new directory for the application or tool, place the relevant dotfiles inside, and use GNU Stow to symlink them.

<hr>

### FONT

ShureTechMono Nerd Font ( AKA ShareTech )



<hr>

Permanently Disable Dock on MacOS
```bash
defaults write com.apple.dock autohide-delay -float 1000; killall Dock
```

Re-enable Dock
```bash
defaults delete com.apple.dock autohide-delay; killall Dock
```
