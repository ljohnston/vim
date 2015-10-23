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

[ -L ~/.vrapperrc ] && rm ~/.vrapperrc
ln -s $VIM_DIR/vimfiles/vrapperrc ~/.vrapperrc

#
# Installing via the command-line can display the following warnings...
#
# not found in 'runtimepath': "eclim/after/plugin/*.vim"
# not found in 'runtimepath': "autoload/vimproc.vim"
#
# ... many times. We can grep these out. We can also minimize them 
# (at least the vimproc.vim ones) by specifically installing vimproc.vim 
# first (which I think may be a good idea anyway - I see this in the 
# neobundle help).
#

$VIM_DIR/bundle/neobundle.vim/bin/neoinstall vimproc.vim 2>&1 \
    |grep -v 'eclim/after/plugin/\*\.vim' \
    |grep -v 'autoload/vimproc\.vim'

$VIM_DIR/bundle/neobundle.vim/bin/neoinstall 2>&1 \
    |grep -v 'eclim/after/plugin/\*\.vim'

