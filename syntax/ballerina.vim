" {{{ Keywords
syntax keyword  ballerinaKeyword
  \ public private
  \ var new
  \ is on
  \ returns
  \ import
  \ check
  \ final type const annotation
  \ if else
  \ match
  \ foreach in while continue break
  \ fork start wait flush
  \ panic return
highlight default link ballerinaKeyword   Keyword
" }}}

" {{{ Types
syntax keyword  ballerinaType
  \ nil boolean int float decimal string
  \ array tuple map record table xml error
  \ future object service typedesc handle
  \ singleton union optional any anydata byte json
  \ resource listener
highlight default link ballerinaType      Keyword

" }}}

" {{{ Numbers
syntax      match         ballerinaNumber    "\v<\d+>"
syntax      match         ballerinaNumber    "\v<\d+\.\d+>"
syntax      match         ballerinaNumber    "\v<\d*\.?\d+([Ee]-?)?\d+>"
syntax      match         ballerinaNumber    "\v<0x\x+([Pp]-?)?\x+>"
syntax      match         ballerinaNumber    "\v<0b[01]+>"
syntax      match         ballerinaNumber    "\v<0o\o+>"
highlight   default link  ballerinaNumber    Number
" }}}

" {{{ Functions
syntax      match         ballerinaFuncDefinition   /\<function\>/ nextgroup=ballerinaFuncName skipwhite skipnl
syntax      match         ballerinaFuncCall         /\.\|->/ nextgroup=ballerinaFuncName,ballerinaFuncParens skipwhite skipnl
syntax      match         ballerinaFuncName         /\w\+/ contained skipwhite skipnl
syntax      match         ballerinaFuncArgs         /(.*)/ contained skipwhite skipnl
highlight   default link  ballerinaFuncDefinition   Keyword
highlight   default link  ballerinaFuncName         Type
" }}}

" {{{ Strings
syntax    region        ballerinaString               start=/"/ skip=/\\"/ end=/"/ oneline contains=ballerinaInterpolatedWrapper
syntax    region        ballerinaInterpolatedWrapper  start="\v\$\{\s*" end="\v\s*\}" contained containedin=ballerinaString contains=ballerinaInterpolatedString
syntax    match         ballerinaInterpolatedString   "\v\w+(\{\})?" contained containedin=ballerinaInterpolatedWrapper
highlight default link  ballerinaString               String
highlight default link  ballerinaInterpolatedWrapper  Delimiter
" }}}

" {{{ Comments
syntax    keyword       ballerinaTodo           TODO XXX FIXME NOTE
syntax    cluster       ballerinaCommentGroup   contains=ballerinaTodo
syntax    region        ballerinaDoc            start="#" end="$"
syntax    region        ballerinaComment        start="//" end="$" contains=ballerinaCommentGroup,@Spell
syntax    region        ballerinaComment        start="/\*" end="\*/" contains=ballerinaCommentGroup,@Spell fold
syntax    match         ballerinaComment        "\v(^\s*//.*\n)+" contains=ballerinaCommentGroup,@Spell fold
highlight default link  ballerinaTodo           Todo
highlight default link  ballerinaDoc            SpecialComment
highlight default link  ballerinaShebang        Comment
highlight default link  ballerinaComment        Comment
highlight default link  ballerinaMarker         Comment
" }}}
