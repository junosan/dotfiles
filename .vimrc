syntax on
filetype plugin on

set timeoutlen=1000 ttimeoutlen=0
set sw=4 sts=4 et

autocmd Filetype gitcommit setlocal spell textwidth=72

" See http://vimdoc.sourceforge.net/htmldoc/syntax.html
"
" To define cCustomFunc, add the following (without " ) in ~/.vim/syntax/c.vim
" syn match    cCustomParen    "?=(" contains=cParen,cCppParen
" syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
" syn match    cCustomScope    "::"
" syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

set background=dark
:hi Comment ctermfg=darkgreen

:hi Constant ctermfg=green
:hi String ctermfg=darkred
:hi Boolean ctermfg=darkblue

:hi Identifier ctermfg=yellow
:hi cCustomFunc ctermfg=yellow

:hi Statement ctermfg=darkmagenta

:hi PreProc ctermfg=darkmagenta

:hi Type ctermfg=darkblue
