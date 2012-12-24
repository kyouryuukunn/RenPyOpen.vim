
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
setlocal cpo&vim

if !exists("*s:RenPyExe")
function s:RenPyExe()
	" expand("%:p:h")はファイルがカレントドライブにあったらドライブレター
	" なし、あったらあり
	if g:renpyopen_use_vimproc == 1
		exec ':call vimproc#system_bg('''.g:renpy_exepath.' '.s:renpy_gamepath.''')'
	else
		exec ':!"'.g:renpy_exepath.'" "'.s:renpy_gamepath.'"'
	endif
endfunction
endif

let s:renpy_gamepath = strpart( expand("%:p:h"), 0, strridx(expand("%:p:h"), 'game') - 1 ) "  thispath /game

let &cpo = s:save_cpo
unlet! s:save_cpo

command! -buffer RenPyExe  :call s:RenPyExe()

" vim: ts=2 sw=2 sts=2 foldmethod=marker nowrap
