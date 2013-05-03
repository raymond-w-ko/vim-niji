let s:save_cpo = &cpo
set cpo&vim

let s:matching_filetypes = ['lisp', 'scheme', 'clojure']

let s:matching_characters = [['(', ')'],
                           \ ['\[', '\]'],
                           \ ['{', '}']]

let s:dark_colours = [['red', 'red1'],
                    \ ['yellow', 'orange1'],
                    \ ['green', 'yellow1'],
                    \ ['cyan', 'greenyellow'],
                    \ ['magenta', 'green1'],
                    \ ['red', 'springgreen1'],
                    \ ['yellow', 'cyan1'],
                    \ ['green', 'slateblue1'],
                    \ ['cyan', 'magenta1'],
                    \ ['magenta', 'purple1']]

let s:light_colours = [['red', 'red3'],
                          \ ['darkyellow', 'orangered3'],
                          \ ['darkgreen', 'orange2'],
                          \ ['blue', 'yellow3'],
                          \ ['darkmagenta', 'olivedrab4'],
                          \ ['red', 'green4'],
                          \ ['darkyellow', 'paleturquoise3'],
                          \ ['darkgreen', 'deepskyblue4'],
                          \ ['blue', 'darkslateblue'],
                          \ ['darkmagenta', 'darkviolet']]

let s:matching_filetypes = exists('g:niji_matching_filetypes') ? g:niji_matching_filetypes : s:matching_filetypes
let s:matching_characters = exists('g:niji_matching_characters') ? g:niji_matching_characters : s:matching_characters
let s:dark_colours = exists('g:niji_dark_colours') ? g:niji_dark_colours : s:dark_colours
let s:light_colours = exists('g:niji_light_colours') ? g:niji_light_colours : s:light_colours

call reverse(s:dark_colours)
call reverse(s:light_colours)

let s:current_colour_set = &bg == 'dark' ? s:dark_colours : s:light_colours

function! niji#load()
	" Is this necesary? Does lisp_rainbow conflict?
	if !exists('g:niji_disable_lisp_rainbow')
		let g:lisp_rainbow = 0
	endif

	if count(s:matching_filetypes, &ft) > 0
		for character in s:matching_characters
			for each in range(1, len(s:current_colour_set))
				execute printf('syntax region paren%s matchgroup=level%s start=/%s/ end=/%s/ contains=TOP,%s',
				          \ string(each),
				          \ string(each),
				          \ character[0],
				          \ character[1],
				          \ join(map(range(each, len(s:current_colour_set)),
				                   \ "'paren' . v:val"),
				               \ ','))
			endfor
		endfor

		for each in range(1, len(s:current_colour_set))
			execute printf('highlight default level%s ctermfg=%s guifg=%s',
			             \ string(each),
			             \ s:current_colour_set[each - 1][0],
			             \ s:current_colour_set[each - 1][1])
		endfor
	endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
