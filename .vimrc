set tags=/home/gree/tags,/home/gree/tags_lib
set background=dark
set hlsearch
set laststatus=2
set showcmd
set ignorecase
set tabstop=4
set shiftwidth=4
set visualbell
"set foldmethod=marker
set number
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set statusline=%F%m%r%h%w\ [ENC=%{&enc}]\ [FENC=%{&fenc}]\ %=\ %3l/%3L,%3v\ %10P\ %4m
helptags $HOME/.vim/doc

syntax on

"visualize tab, space, etc
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
"set listchars=tab:?-,trail:-,eol:?,extends:?,precedes:?,nbsp:%

" I HATE IT....
set expandtab
set softtabstop=4

"omnifunc
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

"omnifunc error support
setlocal omnifunc=syntaxcomplete#Complete
:map <silent> <F3> :setlocal omnifunc=syntaxcomplete#Complete<CR>

"delete space
:map <silent> <F1> :%s /\s\+$//gc<CR>

" minibufexpl.vim
":let g:miniBufExplMapWindowNavVim = 1
":let g:miniBufExplMapWindowNavArrows = 1
":let g:miniBufExplMapCTabSwitchBuffs = 1

" FuzzyFinder.vim
nnoremap <Space>f f
nnoremap <Space>F F
nnoremap f <Nop>
nnoremap <silent> fb :<C-u>FuzzyFinderBuffer!<CR>
nnoremap <silent> ff :<C-u>FuzzyFinderFile! <C-r>=expand('%:~:.')[:-1-len(expand('%:~:.:t'))]<CR><CR>
nnoremap <silent> fm :<C-u>FuzzyFinderMruFile!<CR>
nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderBuffer!<CR>
nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderFile! <C-r>=expand('#:~:.')[:-1-len(expand('#:~:.:t'))]<CR><CR>
nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderMruFile!<CR>

" bufferlist.vim
":map <silent> <F3> :call BufferList()<CR>

set dictionary=/home/gree/.vim/dict/php.dict
" file encoding
set fileencodings=utf-8
set encoding=utf-8
"set fileencodings=euc-jp
"set encoding=euc-jp


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

"imap
imap <C-h> <Left>
imap <C-l> <Right>
imap <C-j> <Down>
imap <C-k> <UP>


"for java
set sm
set ai
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1
