syntax on
set nocompatible
set nobackup
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileencodings=utf-8,cp932,iso2022-jp,euc-jp,sjis,ucs-2
set shiftwidth=4
set tabstop=4
set noexpandtab
set autoindent
set backspace=indent,eol,start

" cgi拡張子はperl扱いにする
au BufRead,BufNewFile,BufReadPre *.cgi set filetype=perl
" rbファイルの設定
au BufRead,BufNewFile,BufReadPre *.rb set ts=2 sts=2 sw=2 et
" erbファイルの設定
au BufRead,BufNewFile,BufReadPre *.erb set ts=2 sts=2 sw=2 et

"--------------------------------------------
" dein設定

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet.vim')
call dein#add('tomtom/tcomment_vim')
call dein#add('AndrewRadev/splitjoin.vim')

call dein#end()

" vim起動時にインストールチェック
if dein#check_install()
	call dein#install()
endif
