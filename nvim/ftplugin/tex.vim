setlocal sts=2
setlocal ts=2
setlocal sw=2
setlocal tw=80


setlocal spelllang=en_ZA
setlocal spell
" Spell Check

highlight SpellBad ctermbg=green

if exists("+colorcolumn")
	highlight ColorColumn ctermbg=darkgrey
	setlocal cc=80
endif
highlight Overlength ctermbg=red ctermfg=white guibg=#592929
match Overlength /\%80v.\+/

if !exists("g:latex_pdf")
	let g:latex_pdf = "pdflatex"
endif

function! CompileLatexPdf()
	silent !clear
	execute "!".g:latex_pdf." ".bufname("%")
endfunction
let g:filename = bufname("%")

let make_pdf = g:latex_pdf." ".g:filename
inoremap <c-s> <esc>:w<cr>:vs<cr>:term<cr>:set modifiable<cr>:put =make_pdf<cr>i<cr><c-\><c-n>
nmap <buffer> <c-s> :w<cr> :call CompileLatexPdf()<cr>

