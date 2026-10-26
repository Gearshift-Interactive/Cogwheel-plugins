if exists("b:did_ftplugin")
    finish
endif

let b:did_ftplugin = 1

setlocal commentstring=//\ %s
setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab
