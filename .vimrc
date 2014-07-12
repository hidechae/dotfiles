"set tags=/home/gree/tags,/home/gree/tags_lib
set background=dark
set hlsearch
"set showcmd
set ignorecase
if v:version>=704
  set wildignorecase
endif
set visualbell
"set foldmethod=marker
"set incsearch
set number
set backspace=2
set nofoldenable

" split new file down or right
set splitbelow
set splitright

" statusline
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
if v:version>=702
  set statusline=%F%m%r%h%w\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ %{fugitive#statusline()}\ %=\ %3l/%3L,%3v\ %10P\ %4m
else
  set statusline=%F%m%r%h%w\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ %=\ %3l/%3L,%3v\ %10P\ %4m
endif
set laststatus=2

"helptags $HOME/.vim/doc

" file encoding
set fileencodings=utf-8
set encoding=utf-8
"set fileencodings=euc-jp
"set encoding=euc-jp

syntax on

"wildmenu
"set wildmenu
"set wildmode=list,longest,full
set wildmode=list:longest

"visualize tab, space, etc
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
"set listchars=tab:?-,trail:-,eol:?,extends:?,precedes:?,nbsp:%

" tab
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
"autocmd FileType smarty set shiftwidth=2
"autocmd FileType html set shiftwidth=2
"autocmd FileType smarty set softtabstop=2
"autocmd FileType html set softtabstop=2

"omnifunc
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

au BufRead,BufNewFile *.scala set filetype=scala
au BufNewFile,BufRead *.go set filetype=go

"omnifunc error support
setlocal omnifunc=syntaxcomplete#Complete
:map <silent> <F3> :setlocal omnifunc=syntaxcomplete#Complete<CR>

"dictionary
autocmd FileType php set dictionary=~/.vim/dict/PHP.dict
autocmd FileType js set dictionary=~/.vim/dict/javascript.dict
autocmd FileType scala set dictionary=~/.vim/dict/scala.dict
autocmd FileType java set dictionary=~/.vim/dict/java.dict
autocmd FileType c set dictionary=~/.vim/dict/c.dict
autocmd FileType cpp set dictionary=~/.vim/dict/cpp.dict

"delete space
:map <silent> <F1> :%s /\s\+$//gc<CR>

" NeoBundle
if v:version>=702
  set nocompatible
  filetype off

  if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim.git
    call neobundle#rc(expand('~/.bundle'))
  endif

"  NeoBundle 'git://github.com/Shougo/vimshell.git'
  NeoBundle 'git://github.com/tpope/vim-fugitive.git'
  NeoBundle 'git://github.com/thinca/vim-quickrun.git'
"  NeoBundle 'git://github.com/vim-scripts/YankRing.vim.git'
"  NeoBundle 'git://github.com/Shougo/vimfiler.git'
"  NeoBundle 'git://github.com/Shougo/unite.vim.git'
"  NeoBundle 'git://github.com/vim-scripts/sudo.vim.git'
"  NeoBundle 'git://github.com/mattn/zencoding-vim.git'
"  NeoBundle 'git://github.com/Shougo/neocomplcache.git'
"  NeoBundle 'git://github.com/vim-scripts/FuzzyFinder.git'
"  NeoBundle 'git://github.com/vim-scripts/L9.git'
"  NeoBundle 'git://github.com/mattn/benchvimrc-vim.git'
"  NeoBundle 'git://github.com/everzet/phpfolding.vim.git'
  NeoBundle 'git://github.com/slim-template/vim-slim.git'

  filetype plugin on
"  filetype indent on
endif


" " neocomplcache
" " 起動時に有効化
" let g:neocomplcache_enable_at_startup = 1
" 
" " 大文字が入力されるまで大文字小文字の区別を無視する
" let g:neocomplcache_enable_smart_case = 1
" 
" " _(アンダースコア)区切りの補完を有効化
" let g:neocomplcache_enable_underbar_completion = 1
" 
" let g:neocomplcache_enable_camel_case_completion  =  1
" 
" " ポップアップメニューで表示される候補の数
" let g:neocomplcache_max_list = 20
" 
" " シンタックスをキャッシュするときの最小文字長
" let g:neocomplcache_min_syntax_length = 3
" 
" " ディクショナリ定義
" let g:neocomplcache_dictionary_filetype_lists = {
"     \ 'default' : '',
"     \ 'php' : $HOME . '/.vim/dict/PHP.dict',
"     \ }
" 
" if !exists('g:neocomplcache_keyword_patterns')
"     let g:neocomplcache_keyword_patterns = {}
" endif
" let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" vimtab
nnoremap <Space> t t
nnoremap <Space> T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" FuzzyFinder.vim
nnoremap <Space>f f
nnoremap <Space>F F
nnoremap f <Nop>
nnoremap <silent> fb :<C-u>FuzzyFinderBuffer!<CR>
nnoremap <silent> ff :<C-u>FuzzyFinderFile! <C-r>=expand('%:~:.')[:-2-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> fm :<C-u>FuzzyFinderMruFile!<CR>
nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderBuffer!<CR>
nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderFile! <C-r>=expand('#:~:.')[:-2-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderMruFile!<CR>

" " FuzzyFinder.vim
" nnoremap <Space>f f
" nnoremap <Space>F F
" nnoremap f <Nop>
" nnoremap <unique> <silent> fb :<C-u>FufBuffer!<CR>
" nnoremap <unique> <silent> ff :<C-u>FufFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
" nnoremap <unique> <silent> <C-t> :<C-u>FufFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
" nnoremap <unique> <silent> fm :<C-u>FufMruFile!<CR>
" nnoremap <unique> <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FufBuffer!<CR>
" nnoremap <unique> <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FufFile! <C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
" nnoremap <unique> <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FufMruFile!<CR>


" VimShell
let g:vimshell_prompt = ' ~  '
" nnoremap <unique> <silent> vs :<C-u>vs<CR>:<C-u>VimShell<CR><ESC>:<C-u>set nonu<CR>a
nnoremap <silent> vs :<C-u>VimShellPop<CR><ESC>:<C-u>set nonu<CR>a
nnoremap v <Nop>
nnoremap s <Nop>


" VimFiler
" let g:vimfiler_as_default_explorer = 1
nnoremap <silent> vf :cd %:p:h<CR>:<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>


" Move to Current Directory
nnoremap <silent> cd :cd %:p:h<CR>
" augroup group_vimrc_cd
"     autocmd!
"     autocmd BufEnter * execute ":lcd " . (isdirectory(expand("%:p:h")) ? expand("%:p:h") : "")
" augroup END

" YankRing
" nnoremap <silent> yr :<C-u>YRShow<CR>

" Char Code
if has('iconv')
   let s:enc_euc = 'euc-jp'
   let s:enc_jis = 'iso-2022-jp'
   " iconvがeucJP-msに対応しているかをチェック
   if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
       let s:enc_euc = 'eucjp-ms'
       let s:enc_jis = 'iso-2022-jp-3'
   " iconvがJISX0213に対応しているかをチェック
   elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
       let s:enc_euc = 'euc-jisx0213'
       let s:enc_jis = 'iso-2022-jp-3'
   endif
   " fileencodingsを構築
   if &encoding ==# 'utf-8'
       let s:fileencodings_default = &fileencodings
       let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
       let &fileencodings = &fileencodings .','. s:fileencodings_default
       unlet s:fileencodings_default
   else
       let &fileencodings = &fileencodings .','. s:enc_jis
       set fileencodings+=utf-8,ucs-2le,ucs-2
       if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
           set fileencodings+=cp932
           set fileencodings-=euc-jp
           set fileencodings-=euc-jisx0213
           set fileencodings-=eucjp-ms
           let &encoding = s:enc_euc
           let &fileencoding = s:enc_euc
       else
           let &fileencodings = &fileencodings .','. s:enc_euc
       endif
   endif
   " 定数を処分
   unlet s:enc_euc
   unlet s:enc_jis
endif

" map
map <silent> <ESC><ESC> :noh<CR>

" like shell
imap <silent> <C-a> <ESC>0i
imap <silent> <C-e> <ESC>$a
imap <silent> <C-k> <ESC>Di

" for java
set sm
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1

" for MacVim
if has('gui_macvim')
    colorscheme peachpuff
endif

map <silent> ts i{t}<ESC>
map <silent> te i{/t}<ESC>
map <silent> ta a{/t}<ESC>

map <silent> tt i{t}<ESC>ea{/t}<ESC>

map <silent> qq a<CR><ESC>
