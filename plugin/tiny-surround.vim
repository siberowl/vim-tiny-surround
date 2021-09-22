" tiny-surround.vim - Tiny Surround
" Author:       Siberowl
nnoremap <silent> <Plug>ChangeSurround :<C-U>call <SID>changesurround()<CR>
nnoremap <silent> <Plug>DeleteSurround :<C-U>call <SID>deletesurround()<CR>
vnoremap <silent> <Plug>AddSurround :<C-U>call <SID>addsurround()<CR>

if !exists("g:tiny_surround_no_mappings") || ! g:tiny_surround_no_mappings
  nmap cs <Plug>ChangeSurround
  nmap ds <Plug>DeleteSurround
  xmap S <Plug>AddSurround
endif

"// {{{ Surround functions
function! s:surroundgetpair(char)
	if a:char == '{' || a:char == '}'
		return ['{', '}']
	elseif a:char == '[' || a:char == ']'
		return ['[', ']']
	elseif a:char == '(' || a:char == ')'
		return ['(', ')']
	elseif a:char == '<' || a:char == '>'
		return ['<', '>']
	else
		return [a:char, a:char]
	endif
endfunction

function! s:changesurround()
	echo ''
	let comchar = nr2char(getchar())
	let l:temp_x = @x
	let l:temp_z = @z
	if comchar == 'w'
		let char = nr2char(getchar())
		let @x = s:surroundgetpair(char)[0]
		let @z = s:surroundgetpair(char)[1]
    execute ':normal! mXviwv`>"zp`<"xP`Xl'
	else
		let char = nr2char(getchar())
		execute ':normal! mXvi' . comchar . 'v`>lr' . s:surroundgetpair(char)[1] . '`<hr' . s:surroundgetpair(char)[0] . '`Xl'
	endif
	let @x = l:temp_x
	let @z = l:temp_z
	echo ''
endfunction

function! s:deletesurround()
	echo ''
	let comchar = nr2char(getchar())
	if comchar == 'w'
		execute ':normal! mXviwv`>ldl`<hdl`Xh'
	else
		execute ':normal! mXvi' . comchar . 'v`>ldl`<hdl`Xh'
	endif
	echo ''
endfunction

function! s:addsurround()
  echo ''
	let l:temp_x = @x
	let l:temp_z = @z
	let char = nr2char(getchar())
  let @x = s:surroundgetpair(char)[0]
  let @z = s:surroundgetpair(char)[1]
	execute ':normal! mX`>"zp`<"xP`Xl'
	let @x = l:temp_x
	let @z = l:temp_z
	echo ''
endfunction
"// }}}
