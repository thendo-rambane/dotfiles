" Tab completion
inoremap <silent> <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent> <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Buffer manip
nnoremap <leader><TAB> :bn<CR>
nnoremap <leader><S-TAB> :bp<CR>
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
nnoremap <leader>h :noh<CR>

" Escape on save
inoremap <C-s> <esc>:w<CR>
nnoremap <C-s> :w<CR>
vnoremap <C-s> :w<CR>

"===============================================================
"*******************************FZF*****************************
"===============================================================

" mappings
nnoremap <silent> <space><space> :<C-u>CocFzfList<CR>
nnoremap <silent> <space>a       :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <space>c       :<C-u>CocFzfList commands<CR>
nnoremap <silent> <space>e       :<C-u>CocFzfList extensions<CR>
nnoremap <silent> <space>l       :<C-u>CocFzfList location<CR>
nnoremap <silent> <space>o       :<C-u>CocFzfList outline<CR>
nnoremap <silent> <space>s       :<C-u>CocFzfList symbols<CR>
nnoremap <silent> <space>p       :<C-u>CocFzfListResume<CR>
