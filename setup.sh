#!/bin/bash -eu
cd $(dirname `realpath $0`)

# set environments
cat environments >> ~/.bash_profile

# create symlink .vim
ln -sf ${PWD}/.vim ${HOME}/.vim
ln -sf ${PWD}/.vimrc ${HOME}/.vimrc

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c "PlugInstall"

# prettier
mkdir -p ~/.vim/pack/plugins/start
git clone https://github.com/prettier/vim-prettier ~/.vim/pack/plugins/start/vim-prettier
