lspList=(
  "efm-langserver"
  "bash-language-server"
  "vscode-css-languageserver-bin"
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
    npm i -g $lsp
  else
    echo -e $lsp" Installed"
  fi
done
