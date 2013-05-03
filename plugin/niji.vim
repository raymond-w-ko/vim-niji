"
" vim-niji - Yet another fork of RainbowParenthsis.vim
"
"  Maintainer: Alastair Touw <alastair@touw.me.uk>
"     Website: http://github.com/amdt/vim-niji
"     License: Public domain.
"     Version: 1.0.0
" Last Change: 2013 May 4
"       Usage: See 'doc/niji.txt' or ':help niji' if installed.
"
" Niji follows the Semantic Versioning specification (http://semver.org).
"

scriptencoding utf-8

if exists("g:loaded_niji")
	finish
endif
let g:loaded_niji = 1

autocmd BufReadPost * nested call niji#load()
