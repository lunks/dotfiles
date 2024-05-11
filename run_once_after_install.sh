#!/usr/bin/env bash

tic tmux/tmux-256color.terminfo
mkdir -p ~/code
tmux/install-tmux-plugin.sh
bat cache -b
