nnoremap <silent> <Plug>ChangeSurround :<C-U>call <SID>changesurround()<CR>
nnoremap <silent> <Plug>DeleteSurround :<C-U>call <SID>deletesurround()<CR>

"// {{{ Surround functions
function! s:surroundgetpair(char)
	if a:char == '{'
		return '}'
	elseif a:char == '['
		return ']'
	elseif a:char == '('
		return ')'
	elseif a:char == '<'
		return '>'
	else
		return a:char
	endif
endfunction

function! s:changesurround()
	echo ''
	let comchar = nr2char(getchar())
	let l:temp_x = @x
	let l:temp_z = @z
	if comchar == 'w'
		let char = nr2char(getchar())
		let @x = char 
		let @z = s:surroundgetpair(char)
    execute ':normal! mXviwv`>"zp`<"xP`Xl'
	else
		let char = nr2char(getchar())
		let @x = char 
		let @z = s:surroundgetpair(char)
		execute ':normal! mXvi' . comchar . 'v`>lr' . s:surroundgetpair(char) . '`<hr' . char . '`Xl'
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
		let char = comchar
		execute ':normal! mXvi' . comchar . 'v`>ldl`<hdl`Xh'
	endif
	echo ''
endfunction
"// }}}
