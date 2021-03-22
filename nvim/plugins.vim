call plug#begin('~/.nvim/plugged')
  " Use release branch (recommend)
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'antoinemadec/coc-fzf'
  Plug 'dense-analysis/ale'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-treesitter/playground'
  Plug 'p00f/nvim-ts-rainbow'
  Plug 'rust-lang/rust.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'christoomey/vim-tmux-navigator'       " allows c-h, c-l, navigation
  Plug 'flazz/vim-colorschemes'               " batch of colors
  Plug 'psf/black', { 'branch': 'stable' }
  "fzf
  Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
  Plug 'junegunn/fzf.vim'                     " needed for previews
  Plug 'mattn/emmet-vim'
  " Tpope witchcraft
  Plug 'tpope/vim-abolish'                    "crs, cru, cr-
  Plug 'tpope/vim-surround'                   " ys<mvmnt>
  Plug 'tpope/vim-fugitive'                   " :Git
  Plug 'tpope/vim-repeat'                     " . Just .
  Plug 'tpope/vim-commentary'                 " gcc, V:gc, gc<mvmnt>, :g/'Taget'/Commentary,

  Plug 'cespare/vim-toml'
  Plug 'leafOfTree/vim-vue-plugin'
  Plug 'windwp/nvim-autopairs'
  Plug 'christianchiarulli/nvcode-color-schemes.vim'
  Plug 'neovim/nvim-lspconfig'

  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  " Plug 'hrsh7th/vim-vsnip-integ'
  Plug 'wyattferguson/jinja2-kit-vscode'

  Plug 'norcalli/snippets.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'fatexii/emmet-compe'
call plug#end()

lua require('nvim-autopairs').setup()
