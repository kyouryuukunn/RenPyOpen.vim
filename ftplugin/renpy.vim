
if exists("b:did_ftplugin")
	finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
setlocal cpo&vim

" Launch a game
function! s:RenPyExe()
	" expand("%:p:h")はファイルがカレントドライブにあったらドライブレター
	" なし、あったらあり
	if g:renpyopen_use_vimproc == 1
		exec ':call vimproc#system_bg(''"'.g:renpy_exepath.'" "'.s:GetGamePath().'"'')'
	else
		exec ':!"'.g:renpy_exepath.'" "'.s:GetGamePath().'"'
	endif
endfunction

" Launch a game and warp to the current line
function! s:RenPyExe_CurrentLine()
	if g:renpyopen_use_vimproc == 1
		exec ':call vimproc#system_bg(''"'.g:renpy_exepath.'" "'.s:GetGamePath().'" --warp '.expand("%").':'.line('.').''')'
	else
		exec ':!"'.g:renpy_exepath.'" "'.s:GetGamePath().'" --warp '.expand('%').':'.line('.')
	endif
endfunction

" get the path of base directory
function! s:GetGamePath()
  return strpart( expand("%:p:h"), 0, strridx(expand("%:p:h"), 'game') - 1 )
endfunction

let &cpo = s:save_cpo
unlet! s:save_cpo

command! -buffer RenPyExe  :call s:RenPyExe()
command! -buffer RenPyExeCurrentLine  :call s:RenPyExe_CurrentLine()

" vim: ts=2 sw=2 sts=2 foldmethod=marker nowrap
