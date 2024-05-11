# Dotfiles

These are my dotfiles.

## Usage

1. Install XCode, homebrew, 1password cli and chezmoi.
2. Run: 

```shell
chezmoi init --verbose https://github.com/$GITHUB_USERNAME/dotfiles.git
chezmoi apply ~/key.txt
chezmoi apply
```
