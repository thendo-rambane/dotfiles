if !exists('g:vscode')
  source ~/dotfiles/nvim/plugins.vim
  source ~/dotfiles/nvim/keys.vim
  source ~/dotfiles/nvim/settings.vim
  source ~/dotfiles/nvim/coc.vim

  let g:loaded_ruby_support = 0
  if has("win32") || has("win16")
    let g:python_host_prog =  '~/virtualenvs/pynvim2/Script/python.exe'
    let g:python3_host_prog = '~/virtualenvs/pynvim3/Scripts/python.exe'
    let g:black_virtualenv = '~/virtualenvs/black'
  else
    let g:python_host_prog =  '~/virtualenvs/pynvim/bin/python'
    let g:python3_host_prog = '~/virtualenvs/pynvim3/bin/python'
    let g:black_virtualenv = '~/virtualenvs/black'
  endif

  let g:vim_vue_plugin_use_typescript = 1
  let g:vim_vue_plugin_use_scss = 1
  let g:vim_vue_plugin_highlight_vue_keyword = 1


  "ctrlp
  let g:ctrlp_user_command = [
              \'.git/',
              \'git --git-dir=%s/.git ls-files -oc --exclude-standard',
              \]

  "===============================================================
  "*****************************Airline***************************
  "===============================================================

  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1

  highlight LineNr term=bold ctermfg=DarkGrey
else
  source ~/dotfiles/nvim/vscodeInitFile.vim
endif
