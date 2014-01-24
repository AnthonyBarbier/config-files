fu! MatchIdx(lineNb)
	return matchend(getline(a:lineNb), '@param[^\]]*\][ ]*[^ ]\+[ ]\+')
endfunction

:fu! OpenDoxy()
	let function_to_find= expand("<cword>")
	exe printf(":! findDoxy.py %s", function_to_find)
endfunction

:fu! Open(module)
	exe "n ". a:module . "/*.h"
	exe "n ". a:module . "/src/*.h"
	exe "n ". a:module . "/src/*.c"
	exe "n ". a:module . "/unit_tests/*.c"
endfunction

:fu! AlignDoxy()
	let maxLen =0
	let line=0
	let maxLine = line('$')
	echo maxLine . "\n"
	while line < maxLine
		let idx = MatchIdx(line)
		if(idx != -1) "new block of comments
			let maxLen= idx
			let startLine = line
			while idx != -1
				if idx > maxLen
					let maxLen = idx
				endif
				let line=line+1
				let idx = MatchIdx(line)
			endwhile
			"Add the spaces
			for lineReplace in range(startLine,line-1)
				let idx= MatchIdx(lineReplace)
				let diff = maxLen - idx
				if diff > 0
					exe printf(":%d",lineReplace)
					exe printf("normal %d|",idx)
					exe printf("normal %da \<Esc>",diff)
				endif
			endfor
		endif
		let line=line+1
	endwhile
endfunction

