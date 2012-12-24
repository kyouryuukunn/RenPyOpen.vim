vimからRen'Pyを開くplugin
いちいちランチャーを開かなくてよいので、楽になる。
空白を含むパスには使えない。

設定:
let g:renpyopen_use_vimproc=1 "vimprocを使うか?
let g:renpy_exepath="e:/Soft/renpy-6.14.1-sdk/renpy.exe" "renpy.exeのpath


This plugin allow you to execute a renpy game by vim.
But this plugin can't treat a path containning a space.


Setting:
let g:renpyopen_use_vimproc=1 "If 1, use vimproc
let g:renpy_exepath="e:/Soft/renpy-6.14.1-sdk/renpy.exe" "the path of renpy.exe
