#!/bin/bash

echo -e "\n"
echo "======================================[Installing pynvim]"

echo -e "\n"
echo "[Install virtualenvs]===================================="

#setup vim python virtual envs
virtualenv -p python2 ~/virtualenvs/pynvim
cd ~/virtualenvs/pynvim
./bin/pip install pynvim  
cd ~

virtualenv -p python3 ~/virtualenvs/pynvim3
cd ~/virtualenvs/pynvim3
./bin/pip install pynvim  
cd ~

virtualenv -p python3 ~/virtualenvs/black
cd ~/virtualenvs/black
./bin/pip install black  
cd ~


echo -e "\n"
echo "[Symlink nvim]==========================================="

if [ ! -d "$HOME/.config/" ];
then
  mkdir $HOME/.config/
fi

#Symlink nvim
cd $HOME/dotfiles
rm -fr $HOME/.config/nvim
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
