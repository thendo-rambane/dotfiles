#!/bin/bash

echo -e "\n"
echo "===================================[Symlink .profile]"
ls -s ./.profile ~/.profile

source ~/.profile

echo -e "\n"
echo "===============================[Installing dot files]"

bash ./scripts/install_deps.sh

echo -e "\n"
echo "===================================[Installing Node]"

bash ./scripts/install_node.sh

expect ./scripts/install_rust.sh

bash ./scripts/nvim_config.sh

bash ./scripts/git_config.sh
