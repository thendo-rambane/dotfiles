#!/bin/bash

while getopts ":n:o:" arg; do
  case $arg in
    n) Name=$OPTARG;;
    o) Options+=("$OPTARG");;
  esac
done

function join { local d=${1-} f=${2-}; if shift 2; then printf %s "$f" "${@/#/$d}"; fi; }

opts="mysql,mailhog"

if [ ${#Options[@]} -gt 0 ] 
then
  opts=$(printf ",%s" "${Options[@]}")
  opts=${opts:1}
fi

echo -e "$opts"

app_name=$(echo $Name | tr -d '\r\n')
if [ -z  "$Name" ];
then
  echo -e "$app_name"
  echo -e "Please enter a laravel project name e.g:\n"
  echo -e "\tlaravel -n {project_name}\n"
else
  echo -e "$app_name"
  curl -s "https://laravel.build/$app_name?with=$ops" | bash
fi

