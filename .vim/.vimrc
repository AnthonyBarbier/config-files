
set makeprg=my_scons
"set makeprg=make
set wildmode=longest,list,full 
set wildmenu

set cot=longest,menu,preview

"
" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set shell=/bin/bash
" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=200		" keep 200 lines of command line history

"set ruler		" show the cursor position all the time
" As above, but with buffer number preceeding usual info
"set statusline=%-0n\ %<%f\ %h%m%r%=%-14.(%l, %c%V%)\ %P
set laststatus=2	" Always show statusline, if there's only one window
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set splitright		" Horizontal splits should put the new window BELOW
set splitbelow		" Vertical splits should put the new window RIGHT
"set spelllang=en_gb	" Proper English ;-)
set dir-=.	" Remove the current directory from the list of places to keep swap files. This makes SVN usage a lot
		" cleaner
set fileformats=unix,dos,mac	" Enable autodetection of newline formats
set list lcs=tab:¬.,trail:#

"tag files
"set tags +=$HOME/.vim/tags/project.ctags

" Default encoding should be Unicode
set encoding=utf8

" c: Comment auto-wrap
" w: Whitespace indicators at end of line
" q: gq uses these settings
" n: Number lists should change indent
" a: Auto paragraph reflow
set formatoptions=cwqna

" PuTTY does odd things with arrow keys
map <ESC>[A <C-Up>
map <ESC>[B <C-Down>
map <ESC>[C <C-Right>
map <ESC>[D <C-Left>

" Fix-up keycodes
" PuTTY in XTermR6 mode
set <F1>=OP
set <F2>=OQ
set <F3>=OR
set <F4>=OS
set <F5>=[15~
set <F6>=[17~
set <F7>=[18~
set <F8>=[19~
set <F9>=[20~
set <F10>=[21~
set <F11>=[23~
set <F12>=[24~

" NB: S-F1 == F11, so S-F1 is probably unreachable
" NB: S-F2 == F12, so S-F2 is probably unreachable
set <S-F1>=[23~
set <S-F2>=[24~
set <S-F3>=[25~
set <S-F4>=[26~
set <S-F5>=[28~
set <S-F6>=[29~
set <S-F7>=[31~
set <S-F8>=[32~
set <S-F9>=[33~
set <S-F10>=[34~
set <S-F11>=[23~
set <S-F12>=[24~


"1

" Disable forced-sync of file-writes, to avoid blocking while we wait for disk
" I/O (or spinning up the disk on laptops)
"set nofsync
set swapsync=

syntax on
set hlsearch
set showmatch

"colorscheme desert

colorscheme nature

 " Enable file type detection.
 " Use the default filetype settings, so that mail gets 'tw' set to 72,
 " 'cindent' is on in C files, etc.
 " Also load indent files, to automatically do language-dependent indenting.
 filetype plugin indent on
 set guifont=Liberation\ Mono\ 8
   if has("win32")
	"set guifont=DejaVu_Sans_Mono:h12:cANSI, Consolas:h13:cANSI
	set dir+=$TEMP
    else
	"set guifont=DejaVu\ Sans\ Mono\ 11,\ Monospace\ 11
    endif


set scrolloff=4     " Keep some lines above/below the cursor visible

set mouse=a
set ttymouse=xterm2 " Works under GNU Screen
set go -=m
set go -=T
set go -=r


au BufNewFile, BufRead SCons* set filetype=scons
set number
set hidden
set cindent
set formatoptions+=r
filetype plugin on
"set comments=s1:/*, mb:\ *, elx:\ */
" Buffers - explore/next/previous: Alt-F12, F12, Shift-F12.
nnoremap <silent> <F12> :BufExplorer<CR>
nnoremap <silent> <F9> :TlistToggle<CR>

"nnoremap <silent> <F11> :bn<CR>
nnoremap <silent> <F10> :OpenDoxy<CR>
nnoremap <silent> <F2> :cp<CR>
nnoremap <silent> <F3> :cn<CR>
nnoremap <silent> <F4> :clist<CR>
nnoremap <silent> <F5> :.,.diffget<CR>:diffupdate<CR>]c
nnoremap <silent> <F6> :.,.diffput<CR>:diffupdate<CR>]c
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>
nnoremap <C-n> <C-e>
nnoremap <C-m> <C-y>

function! CD()
  if bufname("") !~ "^ftp://"
    lcd %:p:h
  endif
endfunction
nnoremap <silent> <F9> :call CD()<CR>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1

set previewheight=12 "set gdb window initial height
":run macros/gdb_mappings.vim "source key mapping for gdb
":set asm=0 "doesn't show assembly stuff
":set gdbprg=gdb_invocation "set gdb invocation string, default is 'gdb'
runtime pyclewn.vim
runtime myscripts.vim

command! -nargs=0 OpenDoxy call OpenDoxy()
command! -nargs=1 Open call Open(<args>)
command! -nargs=1 Diff :vertical diffpatch <f-args>
command! -nargs=0 Clean !rm -rvf ./build ./bin ./bin-qemu
command! -nargs=* SconsDebugUnitNoDoc make profile=x86-32-unit progs_install=bin libs_install=bin <args> -j 4
command! -nargs=* SconsDebugUnitNoDocQemu !PATH=$PATH:/home/tony/work/qemu/compiler/bin KDIR=/home/tony/work/qemu/linux-2.6.36.y ARCH=arm CROSS_COMPILE=/home/tony/work/qemu/compiler/bin/arm-none-linux-gnueabi- scons-2.0.1 profile=armv7-linux-unit winsys=fbdev progs_install=bin-qemu libs_install=bin-qemu <args> -j 4 2>&1 | tee /tmp/scons_output.log
"command! -nargs=* SconsDebugUnitNoDocQemu ! PATH=$PATH:/home/tony/work/qemu/compiler/bin 
"KDIR=/home/tony/work/qemu/linux-2.6.36.y ARCH=arm 
"CROSS_COMPILE=/home/tony/work/qemu/compiler/bin/arm-none-linux-gnueabi- scons-2.0.1 arch=arm_v7 os=linux hw=2 
"doc=0 debug=1 hw=2 progs_install=/home/tony/work/qemu/armel/tmp/bin 
"libs_install=/home/tony/work/qemu/armel/driver
"<args> -j 4 2>&1 | tee /tmp/scons_output.log
command! -nargs=* SconsReleaseUnitNoDoc make profile=x86-32-release doc=0 progs_install=bin libs_install=bin <args> -j 4

"progs_install=bin <args> -j 4

set statusline=[%f][%l,%v][%p%%][len=%L]
set textwidth=110
