setlocal sts=2
setlocal ts=2
setlocal sw=2
setlocal tw=80


setlocal spelllang=en_ZA
setlocal spell
" Spell Check
highlight SpellBad ctermbg=green
nmap <c-f> <esc> :CocCommand markdownlint.fixAll<CR> :w<CR>
