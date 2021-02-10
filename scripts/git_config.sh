#!/bin/bash
echo -e "\n"
echo "======================================[Create .gitconfig]"

read -p "Enter git Email: " git_email
read -p "Enter git Name: " git_name
read -p "Enter git Username: " git_username

git_config_file="$HOME/dotfiles/.gitconfig"
rm -rf $git_config_file
rm -rf $HOME/.gitconfig
touch $git_config_file
git_config_file_contents="[user]\n"
git_config_file_contents=$git_config_file_contents"\temail = ${git_email}\n"
git_config_file_contents=$git_config_file_contents"\tname = ${git_name}\n"
git_config_file_contents=$git_config_file_contents"\n"
git_config_file_contents=$git_config_file_contents"[credential]\n"
git_config_file_contents=$git_config_file_contents"\tusername = ${git_username}\n"
echo -e "${git_config_file_contents}" > $git_config_file

echo -e "\n"
echo "===================================[Symlink .gitconfig]"
ln -s "$git_config_file" $HOME/.gitconfig

echo -e "\n"
echo "=========================================[Git ssh config]"

pc_name="$(whoami)@$(hostname):$(cat /etc/machine-id)"
secrets_dir=$HOME/.secrets
git_key_dir=$secrets_dir/git_api_key

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
    mkdir "$secrets_dir"
    touch "$git_key_dir"
    my_secret_key_dir=$(cat /mnt/c/Users/ramba_enc4ybi/OneDrive/Documents/keys/git/api_key.txt)
    if [ -z "$(my_secret_key_dir | grep 'cat: ')"];
    then
      if [ -n "$my_secret_key_dir" ];
      then
        echo $my_secret_key_dir > $git_key_dir
      fi
    else
      echo "No github api key"
      exit 1
    fi
  fi
  git_pub_api_key="$(cat "$git_key_dir")"
fi

bash $HOME/dotfiles/scripts/git_ssh_config.sh $git_email $git_username $git_pub_api_key $ssh_pub_key_title

  






