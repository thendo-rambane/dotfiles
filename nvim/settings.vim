colorscheme srcery
syntax enable
" allow to scroll in the preview
set mouse=a

set smarttab
set smartindent
set cindent
set tabstop=2 shiftwidth=2 expandtab

set encoding=utf-8
set fileencoding=utf-8

"Code folding
set foldmethod=indent
set foldlevel=20

" TextEdit might fail if hidden is not set.
set hidden "Keep multi buffers open

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile

set autochdir "Current file path is working dir
set cmdheight=2 " Give more space for displaying messages.

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes
set pumheight=10
set splitright "Vertical split right
set splitbelow "Horizontal split left

set number
set relativenumber

set nowrap
set whichwrap+=[,],<,>,h,l

set ruler

set fileformat=unix

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Fugitive Status line addition
set statusline^=%{FugitiveStatusline()}
