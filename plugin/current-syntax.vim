" current-syntax.vim
"
" Author:  foooomio
" License: MIT License

if exists('g:loaded_current_syntax')
  finish
endif
let g:loaded_current_syntax = 1

let s:save_cpo = &cpo
set cpo&vim

function! CurrentSyntax() abort
  let s:id = synID(line('.'), col('.'), 1)
  let s:trans = synIDtrans(s:id)

  if s:id != s:trans
    echon synIDattr(s:id, 'name') . "\tlinks to"
    let s:id = s:trans
  endif

  execute 'highlight ' . synIDattr(s:id, 'name')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
