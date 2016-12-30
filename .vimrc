set nocompatible

"--------------------------------------------
" dein settings

set runtimepath^=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('tomtom/tcomment_vim')
call dein#add('AndrewRadev/splitjoin.vim')
call dein#add('thinca/vim-ref')

call dein#add('thinca/vim-quickrun')
call dein#add('osyo-manga/shabadou.vim')
call dein#add('osyo-manga/vim-watchdogs')
call dein#add('dannyob/quickfixstatus')
call dein#add('KazuakiM/vim-qfsigns')

call dein#add('vim-scripts/smarty-syntax')

call dein#add('junegunn/vim-easy-align')

call dein#add('editorconfig/editorconfig-vim')

call dein#add('stephpy/vim-php-cs-fixer')

call dein#end()

if dein#check_install()
	call dein#install()
endif

filetype plugin indent on

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

syntax on
set nobackup
set encoding=utf-8
set fileencoding=utf-8
set fileformat=unix
set fileencodings=utf-8,cp932,iso2022-jp,euc-jp,sjis,ucs-2
set shiftwidth=4
set tabstop=4
set expandtab
set autoindent
set smartindent
set backspace=indent,eol,start
set hlsearch
set conceallevel=0

au BufRead,BufNewFile,BufReadPre *.cgi set filetype=perl
au BufRead,BufNewFile,BufReadPre *.rb set ts=2 sts=2 sw=2 et
au BufRead,BufNewFile,BufReadPre *.erb set ts=2 sts=2 sw=2 et
au BufRead,BufNewFile,BufReadPre *.yml set ts=2 sts=2 sw=2 et

" .aliasesのファイルタイプをshにする
au BufRead,BufNewfile,BufReadPre .aliases set filetype=sh

"---------------------------------------------------------
" easy-align関連の設定
vmap <Enter> <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"---------------------------------------------------------
" watchdog関連の設定

if !exists("g:quickrun_config")
	let g:quickrun_config = {}
endif

let g:quickrun_config["_"] = {
	\ "runner" : "vimproc",
	\ "runner/vimproc/updatetime" : 10,
	\ }

let g:quickrun_config["watchdogs_checker/_"] = {
	\ "outputter/quickfix/open_cmd" : "",
	\ "hook/qfsigns_update/enable_exit" : 1,
	\ "hook/qfsigns_update/priority_exit" : 3,
	\ }

" If syntax error, cursor is moved at line setting sign.
let g:qfsigns#AutoJump = 1

augroup my_watchdogs
  autocmd!
  autocmd InsertLeave,BufWritePost,TextChanged *.php WatchdogsRun
  autocmd BufRead,BufNewFile *.php WatchdogsRun
augroup END

"---------------------------------------------------------
" vim-php-cs-fixer関連の設定
let g:php_cs_fixer_level = "symfony"              " which level ?
let g:php_cs_fixer_config = "default"             " configuration
let g:php_cs_fixer_php_path = "php"               " Path to PHP
let g:php_cs_fixer_enable_default_mapping = 1     " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                    " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                    " Return the output of command if 1, else an inline information.

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

"---------------------------------------------------------
" neocompleteの設定
" TODO:ファイル分割する

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" neocomplete設定ここまで
"----------------------------------------------------------------------
