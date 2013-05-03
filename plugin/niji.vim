if exists("g:loaded_niji")
	finish
endif
let g:loaded_niji = 1

scriptencoding utf-8

autocmd FileType lisp,scheme,clojure call niji#load()
