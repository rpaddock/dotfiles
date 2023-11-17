#!/bin/sh
#
# Rust
#
# This installs the latest stable version of 
# using Homebrew.

# Check for Homebrew
if test ! $(which rustc)
then
    echo "  Installing Rust for you."

    rustup-init -yc rust-analyzer
fi

exit 0
