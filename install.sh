#!/bin/bash

echo -e "\n"
echo "===============================[Installing dot files]"
echo -e "\n"

bash ./scripts/install_deps.sh

echo -e "\n"
echo "===================================[Installing Node]"
echo -e "\n"

bash ./scripts/install_node.sh

bash ./scripts/install_rust.sh

bash ./scripts/nvim_config.sh

bash ./scripts/git_config.sh
