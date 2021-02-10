#!/bin/bash
echo -e "\n"
echo "===============================[Installing dotfiles deps]"

dependencies=(
  "python-dev" 
  "python3-dev" 
  "python-pip" 
  "python3-pip"
  "build-essential" 
  "curl" 
  "expect" 
  "git" 
  "neovim"
)
for dependency in "${dependencies[*]}"; 
do 
  if [ -z "$(apt list --installed | grep '^${dependency}.*\[installed\]$')" ];
  then
    sudo apt-get install -y $dependency;
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
