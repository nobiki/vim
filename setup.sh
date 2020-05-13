#!/bin/bash -eu
cd $(dirname `realpath $0`)

# set environments
cat environments >> ~/.bash_profile

# create symlink .vim
ln -s ${PWD}/.vim ${HOME}/.vim
ln -s ${PWD}/.vimrc ${HOME}/.vimrc
ln -s ${PWD}/.editorconfig ${HOME}/.editorconfig

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c "PlugInstall"


