#!/usr/bin/env zsh

. "$HOME/.asdf/asdf.sh"
asdf local golang latest
mkdir -p ~/.bin
GOBIN=~/.bin go install github.com/lemonade-command/lemonade@latest
asdf reshim
