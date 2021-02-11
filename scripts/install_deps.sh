#!/bin/bash
echo -e "\n"
echo "===============================[Installing dotfiles deps]"

if [ -z "$(grep -s ^ /etc/apt/sources.list /etc/apt/sources.list.d/* | grep neovim-ppa/stable)" ];
then
  sudo add-apt-repository ppa:
fi
sudo apt-get update
dependencies=(
  "python-dev" 
  "python3-dev" 
  "python-pip" 
  "python3-pip"
  "build-essential" 
  "curl" 
 "software-properties-common"
 "dirmngr"
 "apt-transport-https"
 "lsb-release"
 "ca-certificates"
 "expect" 
  "git" 
  "neovim"
)
for dependency in "${dependencies[@]}"; 
do 
  if [ -z "$(dpkg -l | grep '^ii\s\s'$dependency)" ];
  then
    sudo apt-get install -y $dependency;
  else
    echo "${dependency} alredy installed"
  fi
done

if [ -z "$(pip list | grep 'virtualenv')" ];
then
  pip install virtualenv
fi

if [ -z "$(pip3 list | grep 'virtualenv')" ];
then
  pip3 install virtualenv
fi
