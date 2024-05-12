#!/usr/bin/env zsh

mkdir -p ~/.bin
GOBIN=~/.local/bin mise exec go@latest -- go install github.com/lemonade-command/lemonade@latest
