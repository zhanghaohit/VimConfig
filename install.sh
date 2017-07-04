#! /usr/bin/env bash

sudo apt-get install silversearcher-ag cscope exuberant-ctags 
# install vundle from git
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# install the necessary fonts
git clone https://github.com/powerline/fonts.git
cd fonts
./install.sh
mkdir -p ~/.config/fontconfig/conf.d
cp fontconfig/* ~/.config/fontconfig/conf.d
fc-cache -vf
cd ..
rm -rf fonts

# copy this repository
cp -rf * ~/.vim/

# mkdir .backup directory for swap files
mkdir ~/.backup

# vimrc
ln -s ~/.vim/vimrc ~/.vimrc

# install the buidles
vim -c VundleInstall

cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer

# if the vim version is too low, download the source code and compile with
# python enabled

echo "alias ctags='ctags -R --fields=+iaS --extra=+q --sort=yes --c++-kinds=+p'" >> ~/.bashrc
echo "source $HOME/.vim/shell_prompt.sh" >> ~/.bashrc
echo "alias tmux='TERM=xterm-256color /usr/bin/tmux'" >> ~/.bashrc
echo "stty -ixon" >> ~/.bashrc
echo "stty -ixany" >> ~/.bashrc
