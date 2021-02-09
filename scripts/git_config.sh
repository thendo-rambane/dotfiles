#!/bin/bash
echo -e "\n"
echo "======================================[Create .gitconfig]"
echo -e "\n"

read -p "Enter git Email: " git_email
read -p "Enter git Name: " git_name
read -p "Enter git Username: " git_username

git_cofig_file="../.gitconfig"
git_cofig_file_contents="[user]\n"
git_cofig_file_contents=$git_cofig_file_contents"\temail = ${git_email}\n"
git_cofig_file_contents=$git_cofig_file_contents"\tname = ${git_name}\n"
git_cofig_file_contents=$git_cofig_file_contents"\n"
git_cofig_file_contents="[credential]\n"
git_cofig_file_contents=$git_cofig_file_contents"\tusername = ${git_username}\n"
echo -e "${git_cofig_file_contents}" > $git_cofig_file

echo -e "\n"
echo "=========================================[Git ssh config]"
echo -e "\n"

pc_name=$(hostname)
secrets_dir=$HOME"/.secrets/"
git_key_dir=$secrets_dir"/git_api_key"

read -p "Enter git ssh key title(default ${pc_name}): " ssh_pub_key_title
if [ -z "$ssh_pub_key_title" ];
then
  ssh_pub_key_title=$pc_name
fi

read -p "Enter git api key (default ${git_key_dir})): " git_pub_api_key
if [ -z "$git_pub_api_key" ];
then
  if [ ! -e "$git_key_dir" ];
  then
    cat /mnt/c/Users/ramba_enc4ybi/OneDrive/Documents/keys/git/api_key.txt > $git_key_dir
  fi
  git_pub_api_key="$(cat "$git_key_dir")"
fi


echo -e "\n"
echo "[openssh][Checking]======================================"
echo -e "\n"

if [ -z "$(ssh-keygen)"];
then
echo -e "\n"
echo "[openssh][Not found]====================================="
echo -e "\n"
  sudo apt update
  sudo apt install openssh-client

  #restart sshd (openssh daemon)


  #systemctl restart sshd
  /etc/init.d/sshd restart
else
echo -e "\n"
echo "[openssh][Found]========================================="
echo -e "\n"
fi


echo -e "\n"
echo "[openssh][Generate public ssh key]======================="
echo -e "\n"

if [ -z "$(cat ~/.ssh/id_rsa.pub)" ];
then
  ssh-keygen -t rsa -b 4096 -C "$git_email"
  ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)"
fi
  
echo -e "\n"
echo "[openssh][Setting github ssh key]======================="
echo -e "\n"

curl -u "$git_username:$git_pub_api_key" \
  --data '{"title":"'"$ssh_pub_key_title"'","key":"'"$ssh_pub_key"'"}' \
  https://api.github.com/user/keys


echo -e "\n"
echo "===================================[Symlink .gitconfig]"
echo -e "\n"
ls -s "$git_cofig_file" ~/.gitconfig


