#!/bin/sh

if test ! $(which tmux)
then
    echo "  Installing tmux for you."
    brew install tmux --HEAD
fi

if [ ! -d "$HOME/.tmux" ]
then
    echo "  Cloning tmux plugin repo"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
