#!/usr/bin/env bash

tic ~/tmux-256color.terminfo
mkdir -p ~/code
bat cache -b
~/.tmux/plugins/tpm/bin/install_plugins
