#!/bin/bash

# Need wget, git installed.

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIM_DIR="$( cd $SCRIPT_DIR/.. && pwd )"

mkdir -p $VIM_DIR/{autoload,bundle,plugin}

#
# To ensure the latest available release of plugins from vim.org:
#
# - Go to: 'http://www.vim.org/scripts/script.php?script_id=<id>
# - Scroll down to the table at the bottom of the page that lists
#   all available downloads.
# - Check the download link for '...?src_id=<id>'. This is the
#   id we want to wget here.
#

# pathogen:
# - http://www.vim.org/scripts/script.php?script_id=2332
PATHOGEN_SRC_ID=19375

# bufexplorer 
# - http://www.vim.org/scripts/script.php?script_id=42
BUFEXPLORER_SRC_ID=20031

# buffergator
# - http://www.vim.org/scripts/script.php?script_id=3619
BUFFERGATOR_SRC_ID=20082

# buftabs
# - http://www.vim.org/scripts/script.php?script_id=1664
BUFTABS_SRC_ID=15439

# pathogen
rm $VIM_DIR/autoload/pathogen.vim >/dev/null 2>&1
curl "www.vim.org/scripts/download_script.php?src_id=$PATHOGEN_SRC_ID" > $VIM_DIR/autoload/pathogen.vim

# buftabs 
rm $VIM_DIR/plugin/buftabs.vim
wget "http://www.vim.org/scripts/download_script.php?src_id=15439" -O $VIM_DIR/plugin/buftabs.vim

# bufexplorer
cd $VIM_DIR/bundle
rm bufexplorer.zip
wget "http://www.vim.org/scripts/download_script.php?src_id=$BUFEXPLORER_SRC_ID" -O bufexplorer.zip
unzip -o bufexplorer.zip; rm bufexplorer.zip

# buffergator 
cd $VIM_DIR/bundle
rm buffergator.tgz
wget "http://www.vim.org/scripts/download_script.php?src_id=20082" -O buffergator.tgz
tar -zxvf buffergator.tgz; rm buffergator.tgz

cd $VIM_DIR
git clone git://github.com/msanders/snipmate.vim.git  bundle/snipmate.vim
git clone git://github.com/scrooloose/syntastic.git   bundle/syntastic
git clone git://github.com/godlygeek/tabular.git      bundle/tabular
git clone git://github.com/flazz/vim-colorschemes.git bundle/vim-colorschemes
git clone git://github.com/PProvost/vim-ps1.git       bundle/vim-ps1
git clone git://github.com/rodjek/vim-puppet.git      bundle/vim-puppet
git clone git://github.com/tpope/vim-surround.git     bundle/vim-surround

#
# Link up ~/.vimrc to config/vimrc in the project.
# If it already exists as a link, we'll delete it and recreate it.
# If it already exists and is not a link, we'll leave it, causing the 
# subsequent link creation to fail (with an error message we'll want
# to see).
#

[ -L ~/.vimrc ] && rm ~/.vimrc
ln -s $VIM_DIR/config/vimrc ~/.vimrc
