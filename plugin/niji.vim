scriptencoding utf-8

if exists("g:loaded_niji")
	finish
endif
let g:loaded_niji = 1

autocmd BufReadPost * nested call niji#load()
