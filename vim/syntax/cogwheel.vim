" ==============================================================================
" Vim syntax file
" Language:        Cogwheel
" Maintainer:      Priklen <https://github.com/Gigores>
" Last Change:     Sep 8, 2026
" ==============================================================================

if exists("b:current_syntax")
    finish
endif

syntax case match

syn keyword cogKeyword    exit mut or and yield if else not while break new var public import alias
syn keyword cogType       int uint float boolean void char
syn keyword cogBoolean    true false null

syn match   cogNumber     /\v<\d+(\.\d+)?[uf]?>/
syn match   cogIdentifier "\<\l[a-zA-Z0-9_]*\>"
syn match   cogFunction /\v<[a-zA-Z_][a-zA-Z0-9_]*\ze\s*\(/

syntax region cogLineComment start=/\/\// end=/$/
syntax region cogBlockComment start=/\v\/\*/ end=/\v\*\//

syn match   cogEscape      contained  +\\[nrtbf0"\\]+
syn region  cogString      start=+"+  end=+"+  skip=+\\\\\|\\"+  contains=cogEscape
syn region  cogChar        start=+'+  end=+'+  skip=+\\\\\|\\'+  contains=cogEscape

hi link cogKeyword      Keyword
hi link cogType         Type
hi link cogBoolean      Boolean
hi link cogNumber       Number
hi link cogFunction     Function
hi link cogLineComment  Comment
hi link cogBlockComment Comment
hi link cogString       String
hi link cogChar         String
hi link cogEscape       Special

let b:current_syntax = "cogwheel"
