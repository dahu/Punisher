" Vim global plugin for punishing errant behaviour
" Maintainer:	Barry Arthur <barry.arthur@gmail.com>
" Version:	0.1
" Description:	Curb bad habits with the pain of time. Atone for your sins.
" Last Change:	2013-01-13
" License:	Vim License (see :help license)
" Location:	plugin/punisher.vim
" Website:	https://github.com/dahu/punisher
"
" See punisher.txt for help.  This can be accessed by doing:
"
" :helptags ~/.vim/doc
" :help punisher

let g:punisher_version = '0.1'

" Vimscript Setup: {{{1
" Allow use of line continuation.
let s:save_cpo = &cpo
set cpo&vim

" Private Functions: {{{1

let s:punishments = 0

" Public Interface: {{{1
"
function! Punish(char)
  if exists('g:punishment')
    let now = reltime(g:punishment)
    if now[0] == 0
      let s:punishments += 1
      echohl WarningMsg
      echo "Don't Do That!"
      echohl None
      exe "sleep " . s:punishments
    endif
    unlet g:punishment
  endif
  return a:char
endfunction

function! Penalty(key)
  let g:punishment = reltime()
  return a:key
endfunction

function! Atone()
  echohl WarningMsg
  echo "Go With Vim My Child"
  echohl None
  exe "sleep " . s:punishments
  let s:punishments = 0
endfunction

" Commands: {{{1
command! -nargs=0 -bar Atone call Atone()

" Teardown:{{{1
"reset &cpo back to users setting
let &cpo = s:save_cpo

" vim: set sw=2 sts=2 et fdm=marker:
