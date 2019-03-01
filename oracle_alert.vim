" Vim syntax file
" Language: Oracle Alert Log
" Maintainer:   Cesar Inacio martins <cesar dot inacio dot martins at gmail dot com>
" Last Change:  2019-02-27
"
"
"
" # by Cesar Inacio Martins
" cs_re:blue,,bold:^... ... [0-9]{2} ..:..:.. ....$
" cs_re:blue,,bold:^... ... [0-9]{2} ..:..:.. ....$
" cs_re:green,,bold:^....:.*
" cs_re:yellow:^[-A-Z0-9* ]{4,}
" cs_re:red,,bold:([sS]tarting|[sS]topping)
" cs_re:red:^.*= .*
" #
" cs_re:red,,bold:^ORA-0*600.*
" cs_re:red,,bold:^ORA-0*7445.*
" # ORA-07745:?
" cs_re_s:yellow:^ORA-([^:]*):
"
"

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn case ignore

syn match OraalertDate "^... ... [0-9]\{2} ..:..:.. .*"
syn match OraalertYel  "^[^ ]\{1,15}:.*"
syn match OraalertArc  "^ARC.:.*"
syn match OraalertYel  "^[-A-Z0-9* ]{4,}"
syn match OraalertRed  "([sS]tarting|[sS]topping)"
syn match OraalertRed  "^.*= .*"
syn match OraalertERR  "^ORA-\([^:]*\):"
syn match OraalertRed  "^errors in file.*"
syn match OraalertOra  "^ORA-0*600.*"
syn match OraalertOra  "^ORA-0*7445.*"
syn match OraalertAlt  "alter .*"
syn match OraalertBlu  "^completed:"
syn match OraalertMisc "^\(private strand.*\|Thread.*allocate new log.*\)"
syn match OraalertWarn "^warning:"
syn match OraalertStart "^Starting up ORACLE.*"
syn match OraalertParam "^ .* *= .*"

" === initialization syntax group ===
syn region OraalertTNS      start="^*\+$"  end="^... ... [0-9]\{2} ..:..:.. ....$" 
syn sync minlines=200

hi link   OraalertDate Include
hi link   OraalertArc  TypeDef
hi link   OraalertYel  Keyword
hi link   OraalertRed  Tag
hi link   OraalertERR  Error
hi link   OraalertOra  Todo
hi link   OraalertBlu  String
hi link   OraalertAlt  String
hi link   OraalertTNS  String
hi link   OraalertWarn Todo
hi link   OraalertStart Todo
hi link   OraalertParam Label

hi OraalertAlt cterm=bold
hi OraalertMisc  cterm=bold ctermfg=0 

let b:current_syntax = "oracle_alert"
