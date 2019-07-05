#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
if [ -d $olddir ]
then
    rm -rf $olddir
fi
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving .$file from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

git clone https://github.com/gmarik/Vundle.vim.git vim/bundle/Vundle.vim

vim +PluginInstall +qall

ycmdir=vim/bundle/YouCompleteMe
echo $ycmdir
if [ -d $ycmdir ]
then
    echo "Installing youcompleteme"
    cd $ycmdir
    python3 install.py --clang-completer
fi
