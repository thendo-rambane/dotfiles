call plug#begin('~/.nvim/plugged')
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'antoinemadec/coc-fzf'
Plug 'rust-lang/rust.vim'
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'gilgigilgil/anderson.vim'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-abolish' 
Plug 'tpope/vim-surround' 
Plug 'tpope/vim-fugitive' 
Plug 'tpope/vim-repeat' 
Plug 'cespare/vim-toml'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

nnoremap <silent> <space>n :bn<CR>
nnoremap <silent> <space>N :bp<CR>
nnoremap <silent> <space>d :bd<CR>

nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

let g:loaded_ruby_support = 0
let g:python_host_prog =  '~/virtualenvs/pynvim/bin/python'
let g:python3_host_prog = '~/virtualenvs/pynvim3/bin/python'
let g:black_virtualenv = '~/virtualenvs/black'
"inoremap jk <ESC>
nmap <C-b> :NERDTreeToggle<CR>
nmap <C-_> <plug>NERDCommenterToggle
vmap <C-_> <plug>NERDCommenterToggle
imap <C-s> <esc>:w<CR>
nmap <C-s> :w<CR>
vmap <C-s> :w<CR>

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

nnoremap <leader>h :tabprev<CR>
nnoremap <leader>l :tabnext<CR>

noremap <leader>[ zc
noremap <leader>] zo
set foldmethod=marker foldmarker={,} foldlevel=1

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
set noswapfile
set autochdir
" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set splitright
set splitbelow

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
  "let col = col('.') - 1
  "return !col || getline('.')[col - 1]  =~# '\s'
"endfunction



let g:NERDTreeGitStatusWithFlags = 1

let g:NERDTreeIgnore = ['^node_modules$', '^target$']

"ctrlp
let g:ctrlp_user_command = [
			\'.git/', 
			\'git --git-dir=%s/.git ls-files -oc --exclude-standard',
			\]

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set smarttab
set cindent
set tabstop=2 shiftwidth=2 expandtab

set encoding=UTF-8
colorscheme gruvbox
"let g:gruvbox_improved_warnings=1

function! IsNERDTreeOpen()
	return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
	if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
		NERDTreeFind
		wincmd p
	endif
endfunction

autocmd BufEnter * call SyncTree()

"===============================================================
"*******************************FZF*****************************
"===============================================================
" allow to scroll in the preview
set mouse=a

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




"===============================================================
"*****************************Airline***************************
"===============================================================

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" ===============================================================
" *****************************COC*******************************
" ===============================================================

let g:coc_global_extensions = [
			\'coc-markdownlint',
			\'coc-vetur',
			\'coc-jest',
			\'coc-eslint',
			\'coc-snippets',
			\'coc-pairs',
			\'coc-rust-analyzer',
			\'coc-highlight',
			\'coc-rls',
      \'coc-json',
      \'coc-tsserver',
			\'coc-actions',
			\]

" Setup to use \a(movement for code actions)
function! s:cocActionOpenFromSelected(type) abort
	execute 'CocCommand actions.open '. a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open '.visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionOpenFromSelected<CR>g@

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1] = ~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader><space>n  <Plug>(coc-rename)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Fugitive Status line addition
set statusline^=%{FugitiveStatusline()}

highlight Overlength ctermbg=red ctermfg=white guibg=#592929
match Overlength /\%80v.\+/

highlight LineNr term=bold ctermfg=DarkGrey 

set number
set relativenumber
