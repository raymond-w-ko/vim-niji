"
" vim-niji - Yet another fork of RainbowParenthsis.vim
"
"  Maintainer: Alastair Touw <alastair@touw.me.uk>
"     Website: http://github.com/amdt/vim-niji
"     License: Distributed under the same terms as Vim. See ':h license'.
"     Version: 1.0.1
" Last Change: 2013 May 8
"       Usage: See 'doc/niji.txt' or ':help niji' if installed.
"
" Niji follows the Semantic Versioning specification (http://semver.org).
"
" GetLatestVimScripts: 4580 20067 vim-niji
"

scriptencoding utf-8

if exists("g:loaded_niji")
	finish
endif
let g:loaded_niji = 1

let s:matching_filetypes = ['lisp', 'scheme', 'clojure']
let s:matching_filetypes = exists('g:niji_matching_filetypes') ? g:niji_matching_filetypes : s:matching_filetypes

function s:load()
	if count(s:matching_filetypes, &ft) > 0 || exists('g:niji_match_all_filetypes')
		call niji#highlight()
	endif
endfunction

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost * nested call s:load()
