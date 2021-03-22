#!/bin/bash

lspList=(
  "bash-language-server"
  "vscode-css-languageserver-bin"
  "sql-language-server"
  "dockerfile-language-server-nodejs"
  "vscode-html-languageserver-bin"
  "typescript"
  "typescript-language-server"
  "vscode-json-languageserver"
  "pyright"
  "vls"
  "vim-language-server"
)
for lsp in "${lspList[@]}";
do
  if [ -z "$(npm list -g $lsp | grep $lsp )" ];
  then
    echo -e "Installing $lsp"
    npm i -g $lsp
  else
    echo -e $lsp" Installed"
  fi
done

echo -e "Installing Lua"
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive

cd 3rd/luamake
ninja -f ninja/linux.ninja
cd ../..
./3rd/luamake/luamake rebuild
