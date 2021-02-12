#!/bin/bash

echo -e "\n"
echo "========================================[Installing nvim]"

if [ -z "$(which nvim)" ];
then
  cd $HOME
  wget https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage
  sudo chmod u+x nvim.appimage && ./nvim.appimage --appimage-extract
  if [ ! -e $HOME/installs/nvim  ];
  then
    mkdir -p $HOME/installs/nvim
  fi
  cp $HOME/squashfs-root/* $HOME/installs/nvim/
  if [ ! -e $HOME/.local/bin ];
  then
    mkdir $HOME/.local/bin/ -p
  fi
  ln -s $HOME/installs/nvim/usr/bin/nvim $HOME/.local/bin/nvim
  rm $HOME/squashfs-root $HOME/.nvim.appimage -fr 
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

#Symlink nvim
rm -fr $HOME/.config/nvim
rm -fr $HOME/dotfiles/nvim/nvim
ln -s $HOME/dotfiles/nvim $HOME/.config/nvim
