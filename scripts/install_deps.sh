#!/bin/bash
echo -e "\n"
echo "===============================[Installing dot file deps]"
echo -e "\n"

sudo apt-get install -y \
  python-dev \
  python3-dev \
  python-pip \
  python3-pip \
  build-essential \
  curl \
  expect \
  git \
  neovim

pip install virtualenv
pip3 install virtualenv
