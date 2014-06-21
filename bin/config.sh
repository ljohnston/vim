#!/bin/bash

# Need git installed.
type git >/dev/null 2>&1 || { echo >&2 "'git' not installed. Aborting..."; exit 1; }

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIM_DIR="$( cd $SCRIPT_DIR/.. && pwd )"

rm -rf $VIM_DIR/bundle 2>/dev/null
mkdir -p $VIM_DIR/bundle

git clone https://github.com/Shougo/neobundle.vim $VIM_DIR/bundle/neobundle.vim

#
# Link up ~/.vimrc to config/vimrc in the project.
# If it already exists as a link, we'll delete it and recreate it.
# If it already exists and is not a link, we'll leave it, causing the 
# subsequent link creation to fail (with an error message we'll want
# to see).
#

[ -L ~/.vimrc ] && rm ~/.vimrc
ln -s $VIM_DIR/vimfiles/vimrc ~/.vimrc
