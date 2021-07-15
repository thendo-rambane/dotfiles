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
xnoremap <silent> <leader>a :<C-u>execute 'CocCommand actions.open '.visualmode()<CR>
nnoremap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionOpenFromSelected<CR>" g@

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nnoremap <silent> [g <Plug>(coc-diagnostic-prev)
nnoremap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

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

nnoremap <leader><space>n  <Plug>(coc-rename)
