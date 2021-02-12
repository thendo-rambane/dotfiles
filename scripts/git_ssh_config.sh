#!/bin/bash

echo -e "\n"
echo "[openssh][Checking]======================================"

if [ -z "$(which ssh-keygen)" ];
then
  echo -e "\n"
  echo "[openssh][Not found]====================================="

  sudo apt update
  sudo apt install openssh-client
else

  echo -e "\n"
  echo "[openssh][Found]========================================="

fi


echo -e "\n"
echo "[openssh][Generate public ssh key]======================="

git_email=${1}
git_username=${2}
git_pub_api_key=${3}
git_ssh_pub_key_title=${4}

if [ -z "$(cat ~/.ssh/id_rsa.pub)" ];
then
  ssh-keygen -t rsa -b 4096 -C "$git_email"
fi
ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)"
  
echo -e "\n"
echo "[openssh][Getting github ssh keys]======================"

registered_git_ssh_keys=$(curl \
  -u "$git_username:$git_pub_api_key" \
  -H "Accept: application/vnd.github.v3+json" \
  https://api.github.com/user/keys -sf
)

if [ -z "$(echo ${registered_git_ssh_keys} | grep $git_ssh_pub_key_title)" ];
then
  echo -e "\n"
  echo "[openssh][Setting github ssh key]======================="

  result=$(curl \
    -u "$git_username:$git_pub_api_key" \
    --data '{"title":"'"$git_ssh_pub_key_title"'","key":"'"$ssh_pub_key"'"}' \
    https://api.github.com/user/keys -s
  )

  if [ -z "$(echo '$result' | grep '$git_ssh_pub_key_title')" ];
  then
    echo "Registered ssh id with key: ${git_ssh_pub_key_title} to github"
  else
    echo -e "Error: Could not register ssh id with key: ${git_ssh_pub_key_title} to github\n${result}"
  fi
else
    echo "Key: ${git_ssh_pub_key_title} already in use"
fi

