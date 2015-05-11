#! /bin/bash

cd `dirname "${BASH_SOURCE[0]}"`
dir=`pwd`

files=`ls -A | grep -v "install.sh" | grep -v ".git"`

mkdir -p ~/dotfiles_backup

for file in $files; do
    mv ~/$file ~/dotfiles_backup
    ln -s $dir/$file ~/$file
done    

if [ ! -e ~/.vim/bundle/Vundle.vim ]; then
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

