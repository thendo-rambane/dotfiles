#!/user/bin
curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.0/install.sh -o install_nvm.sh

bash install_nvm.sh

source ~/.bashrc

nvm install --lts
