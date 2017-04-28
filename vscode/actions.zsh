#!/bin/zsh

function p5() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 DIRECTORY" >&2
        return
    fi
    
    if [ -d "$1" ]; then
        echo "Error: Project directory exists" >&2
        return
    fi

    cp -Rv $HOME/.dotfiles/vscode/skeletons/p5 "${1}"
}


function processing() {
    if [ "$#" -ne 1 ]; then
        echo "Usage: $0 DIRECTORY" >&2
        return
    fi
    
    if [ -d "$1" ]; then
        echo "Error: Project directory exists" >&2
        return
    fi

    cp -Rv $HOME/.dotfiles/vscode/skeletons/processing "${1}"
    mv -v "${1}/sketch.pde" "${1}/${1}.pde"
}
