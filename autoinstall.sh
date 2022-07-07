#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables.
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim"    # list of files/directories to symlink in homedir

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
if [ -d $olddir ]
then
    echo "$olddir already exists, removing."
    rm -rf $olddir
fi
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving .$file from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

if [ -d vim/bundle/Vundle.vim ]
then
    echo "Pulling Vundle.vim."
    cd vim/bundle/Vundle.vim
    git pull
    cd ../../..
else
    echo "Cloning Vundle.vim."
    git clone git@github.com:VundleVim/Vundle.vim.git vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

echo Installing YouCompleteMe.
ycmdir=vim/bundle/YouCompleteMe
if [ -d $ycmdir ]
then
    echo "Installing youcompleteme"
    cd $ycmdir
    python3 install.py --clang-completer --rust-completer --ts-completer
fi
