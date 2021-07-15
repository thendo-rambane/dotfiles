#!/bin/bash

if [ -z  "${1}" ];
then
  app_name=${1}
  echo -e "Please enter a laravel project name e,g:\n"
  echo -e "\tlaravel {project_name}\e"
else
  curl -s https://laravel.build/"$app_name" | bash
fi

