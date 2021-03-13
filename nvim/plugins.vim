call plug#begin('~/.nvim/plugged')
  " Use release branch (recommend)
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'antoinemadec/coc-fzf'
  Plug 'rust-lang/rust.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'christoomey/vim-tmux-navigator'       " allows c-h, c-l, navigation
  Plug 'flazz/vim-colorschemes'               " batch of colors

  "fzf
  Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
  Plug 'junegunn/fzf.vim'                     " needed for previews

  " Tpope witchcraft
  Plug 'tpope/vim-abolish'                    "crs, cru, cr-
  Plug 'tpope/vim-surround'                   " ys<mvmnt>
  Plug 'tpope/vim-fugitive'                   " :Git
  Plug 'tpope/vim-repeat'                     " . Just .
  Plug 'tpope/vim-commentary'                 " gcc, V:gc, gc<mvmnt>, :g/'Taget'/Commentary,

  Plug 'cespare/vim-toml'
  Plug 'leafOfTree/vim-vue-plugin'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/nvim-compe'
call plug#end()
