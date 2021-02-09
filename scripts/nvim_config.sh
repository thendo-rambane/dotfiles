#!/bin/bash

echo -e "\n"
echo "======================================[Installing pynvim]"
echo -e "\n"


echo -e "\n"
echo "[Install virtualenvs]===================================="
echo -e "\n"

#setup vim python virtual envs
virtualenv -p python2 ~/virtualenvs/pynvim
cd ~/virtualenvs/nvimpy
./bin/pip install pynvim  

virtualenv -p python3 ~/virtualenvs/pynvim3
cd ~/virtualenvs/nvimpy3
./bin/pip install pynvim  


virtualenv -p python3 ~/virtualenvs/black
cd ~/virtualenvs/black
./bin/pip install black  


echo -e "\n"
echo "[Symlink nvim]==========================================="
echo -e "\n"

#Symlink nvim
ls -s ./nvim/ ~/.config/nvim
