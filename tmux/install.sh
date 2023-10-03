#!/bin/sh

if [ ! -d "$HOME/.tmux" ]
then
    echo "  Cloning tmux plugin repo"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
