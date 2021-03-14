#!/bin/bash
echo -e "\n"
echo "===============================[Installing dotfiles deps]"

sudo apt-get update
dependencies=(
  "ninja-build"
  "gettext"
  "libtool"
  "libtool-bin"
  "autoconf"
  "automake"
  "cmake"
  "g++"
  "pkg-config"
  "unzip"
  "wget"
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
)
for dependency in "${dependencies[@]}";
do
  if [ -z "$(dpkg -l | grep '^ii\s\s'$dependency)" ];
  then
    sudo apt-get install -y $dependency;
  else
    echo "${dependency} already installed"
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
