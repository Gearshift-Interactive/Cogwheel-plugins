if exists("b:did_indent")
    finish
endif

let b:did_indent = 1

setlocal indentexpr=GetCogwheelIndent()
setlocal indentkeys=o,O,*<Return>,<>>,<<>,0},0],0)

if exists("*GetCogwheelIndent")
    finish
endif

function! GetCogwheelIndent() abort
    let lnum = prevnonblank(v:lnum - 1)

    if lnum == 0
        return 0
    endif

    let line = getline(lnum)
    let current = getline(v:lnum)

    let indent = indent(lnum)
    let sw = shiftwidth()

    if current =~ '^\s*[}\])]'
        let indent -= sw
    endif

    if line =~ '[({[]\s*$'
        let indent += sw
    endif

    if line =~ '[,]\s*$'
        let indent += sw
    endif

    return max([indent, 0])
endfunction
