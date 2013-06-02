"
" vim-niji - Yet another rainbow parentheses plugin.
"
"  Maintainer: Alastair Touw <alastair@touw.me.uk>
"     Website: http://github.com/amdt/vim-niji
"     License: Distributed under the same terms as Vim. See ':h license'.
"     Version: 1.0.2
" Last Change: 2013 Jun 02
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

if !exists('g:niji_matching_filetypes')
	let g:niji_matching_filetypes = ['lisp', 'scheme', 'clojure']
endif

function s:load()
	if count(g:niji_matching_filetypes, &ft) > 0 || exists('g:niji_match_all_filetypes')
		call niji#highlight()
	endif
endfunction

autocmd BufNewFile,BufReadPost,FilterReadPost,FileReadPost * nested call s:load()
