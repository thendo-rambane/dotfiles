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

echo -e "Installing podman\n"
if [ -z "$(which podman)" ];
then
  . /etc/os-release
  echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
  curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
  sudo apt-get update
  sudo apt-get -y upgrade
  sudo apt-get -y install podman
  echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | sudo tee /etc/containers/registries.conf
else
  echo "podman already installed"
fi

if [ -z "$(pip list | grep 'virtualenv')" ];
then
  pip install virtualenv
fi

if [ -z "$(pip3 list | grep 'virtualenv')" ];
then
  pip3 install virtualenv
fi
