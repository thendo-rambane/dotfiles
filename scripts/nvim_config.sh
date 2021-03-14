#!/bin/bash

echo -e "\n"
echo "========================================[Installing nvim]"

if [ -z "$(which nvim)" ];
then
  cd $HOME
  sudo rm -rf neovim
  git clone https://github.com/neovim/neovim
  cd neovim
  sudo make CMAKE_BUILD_TYPE=RelWIthDebInfo
  sudo make install
  cd $HOME
  sudo rm -rf neovim
fi

source $HOME/dotfiles/.profile

echo -e "\n"
echo "======================================[Installing pynvim]"

echo -e "\n"
echo "[Install virtualenvs]===================================="

pynvim_dir="${HOME}/virtualenvs/pynvim"
#setup vim python virtual envs
if [ ! -e $pynvim_dir ];
then
  virtualenv -p python2 $pynvim_dir
fi
cd $pynvim_dir

pip=$pynvim_dir"/bin/pip"
if [ -z "$($pip list | grep 'pynvim')" ];
then
  $pip install pynvim
fi
cd $HOME

pynvim_dir="${HOME}/virtualenvs/pynvim3"
#setup vim python virtual envs
if [ ! -e $pynvim_dir ];
then
  virtualenv -p python3 $pynvim_dir
fi
cd $pynvim_dir

pip=$pynvim_dir"/bin/pip"
if [ -z "$($pip list | grep 'pynvim')" ];
then
  $pip install pynvim
fi
cd $HOME

black_dir="${HOME}/virtualenvs/black"
#setup vim python virtual envs
if [ ! -e $black_dir ];
then
  virtualenv -p python3 $black_dir
fi
cd $black_dir

pip=$black_dir"/bin/pip"
if [ -z "$($pip list | grep 'black')" ];
then
  $pip install black
fi
cd $HOME

echo -e "\n"
echo "[Symlink nvim]==========================================="

if [ ! -d "${HOME}/.config/" ];
then
  mkdir $HOME/.config/
fi
bash $HOME/dotfiles/scripts/install_lsp.sh
#Symlink nvim
rm -fr $HOME/.config/nvim
rm -fr $HOME/dotfiles/nvim/nvim
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
