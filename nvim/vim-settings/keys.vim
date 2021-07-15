" Tab completion
" inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')
inoremap <silent><expr> <C-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <C-d>     compe#scroll({ 'delta': -4 })


inoremap jj <ESC>
inoremap kk <ESC>
inoremap hh <ESC>
" inoremap ll <ESC>

" Buffer manip
nnoremap <leader><TAB> :bnext<CR>
nnoremap <leader><S-TAB> :bprevious<CR>
nnoremap <silent> <space>f <esc>:%bdelete<CR>:edit #<CR>normal `"<CR>
nnoremap <silent> <space>d :bd<CR>

" Shift lines with alt
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
nnoremap <A-UP> <A-j>
nnoremap <A-DOWN> <A-k>

inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
inoremap <A-UP> <A-j>
inoremap <A-DOWN> <A-k>

vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
vnoremap <A-UP> <A-j>
vnoremap <A-DOWN> <A-k>

" visual shift text horizontal
vnoremap > >gv
vnoremap < <gv

" remap terminal to function like normal/Insert mode
tnoremap <C-[> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" allow paste from sys clipboard windows
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Tab navigation
nnoremap <S-TAB> :tabprev<CR>
nnoremap <TAB> :tabnext<CR>

" Use left(\[),right(\]) to open close folds
noremap <leader>[ zc
noremap <C-LEFT> zc
noremap <leader>] zo
noremap <C-RIGHT>] zo

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
noremap <silent> <down> j
noremap <silent> <up> k

"switch off highlighting"
nnoremap <leader>h :noh!<CR>

" Escape on save
inoremap <C-s> <esc>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>

"===============================================================
"*******************************FZF*****************************
"===============================================================

" mappings
