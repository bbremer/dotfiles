#!/bin/bash

# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

# Variables.
dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc vim"    # list of files/directories to symlink in homedir

# create dotfiles_old in homedir
if [ -d $olddir ]
then
    echo "$olddir already exists, removing."
    rm -rf $olddir
fi
mkdir -p $olddir

# change to the dotfiles directory
cd $dir

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    mv ~/.$file ~/dotfiles_old/
    ln -s $dir/$file ~/.$file
done

if [ -d vim/bundle/Vundle.vim ]
then
    echo "Pulling Vundle: "
    cd vim/bundle/Vundle.vim
    git pull
    cd ../../..
else
    echo "Cloning Vundle"
    git clone git@github.com:VundleVim/Vundle.vim.git vim/bundle/Vundle.vim
fi

vim +PluginInstall! +qall

# Install pomodoro
case $(uname -s) in
    Linux*)  OS=Linux;;
    Darwin*) OS=Darwin;;
    *)       echo "OS not known"; exit 1
esac
if [ "$OS" = "Linux" ]
then
    echo "TODO: Install work/rest on linux."
elif [ "$OS" = "Darwin" ]
then
    sudo ln -sf $PWD/mac-work.zsh /usr/local/bin/work
    sudo ln -sf $PWD/mac-rest.zsh /usr/local/bin/rest
fi

echo
echo "dev tools versions"

printf "\npython\n"
printf "\tflake8 $(flake8 --version)\n"
printf "\t$(mypy -V)\n"
printf "\t$(black --version | tr '\n' ' ')\n"

printf "\nrust\n"
printf "\t$(rust-analyzer --version)\n"
printf "\t$(rustfmt --version)\n"

printf "\ngo\n"
printf "\t$(gopls version | tr '\n' ' ')\n"

printf "\nracket\n"
printf "\tracket-langserver "$(racket -e "(require setup/getinfo) (require pkg/lib) ((get-info/full (pkg-directory \"racket-langserver\")) 'version)")"\n"
printf "\traco fmt "$(racket -e "(require setup/getinfo) (require pkg/lib) ((get-info/full (pkg-directory \"fmt\")) 'version)")"\n"
