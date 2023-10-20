#!/bin/bash

set -u

# macOSでない場合はなにもしない
if [ "$(uname)" != "Darwin" ] ; then
    echo "Not macOS!"
    exit 1
fi

brew bundle install --file="$HOME/dotfiles/Brewfile"
