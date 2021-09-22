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
		execute ':normal! mXlbh"xpe"zp`X'
	else
		let char = nr2char(getchar())
		let @x = char 
		let @z = s:surroundgetpair(char)
		execute ':normal! mXF' . comchar . 'r' . char . '`Xf' . s:surroundgetpair(comchar) . 'r' . s:surroundgetpair(char) . '`Xh'
	endif
	let @x = l:temp_x
	let @z = l:temp_z
	echo ''
endfunction
function! s:deletesurround()
	echo ''
	let comchar = nr2char(getchar())
	if comchar == 'w'
		execute ':normal! mXlbdhwdl`Xh'
	else
		let char = comchar
		execute ':normal! mXF' . char . 'dl`Xhf' . s:surroundgetpair(char) . 'dl`Xh'
	endif
	echo ''
endfunction
