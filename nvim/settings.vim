colorscheme srcery
syntax enable
" allow to scroll in the preview
set mouse=a

set smarttab
set smartindent
set cindent
set tabstop=2
set shiftwidth=2
set expandtab

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

" Current file path is working dir
set autochdir

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s)
" leads to noticeable delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set signcolumn=yes
set pumheight=10

"Vertical split right
set splitright

"Horizontal split left
set splitbelow

" show line numbers in gutter
set number

" show relative line numbers
set relativenumber

" dont wrap long lines
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
