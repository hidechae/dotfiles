"set tags=/home/gree/tags,/home/gree/tags_lib
set background=dark
set hlsearch
"set showcmd
set ignorecase
set smartcase
if v:version>=704
  set wildignorecase
endif
set visualbell
"set foldmethod=marker
"set incsearch
set number
set backspace=indent,eol,start
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
set fileencoding=utf-8
set encoding=utf-8

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
set tabstop=2
set shiftwidth=2
set expandtab
" set softtabstop=4

" search by rotation
set wrapscan

" filetype and tabwidth
autocmd BufNewFile,BufRead *.rb       set filetype=ruby       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.php      set filetype=php        tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.hh       set filetype=php        tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.hhi      set filetype=php        tabstop=4 shiftwidth=4
autocmd BufNewFile,BufRead *.slim     set filetype=slim       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html     set filetype=html       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.html.tag set filetype=html       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.scss     set filetype=scss       tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.coffee   set filetype=coffee     tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.ts       set filetype=typescript tabstop=4 shiftwidth=4
autocmd BufRead,BufNewFile *.jsx      set filetype=javascript tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.jade     set filetype=jade       tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.jade.tag set filetype=jade       tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.scala    set filetype=scala
autocmd BufRead,BufNewFile *.go       set filetype=go
autocmd BufRead,BufNewFile *.json     set filetype=json       tabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile *.snip     set                     tabstop=2 shiftwidth=2 noexpandtab
autocmd BufRead,BufNewFile *.conf     set filetype=sh         tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.ex       set filetype=elixir     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.exs      set filetype=elixir     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.eex      set filetype=elixir     tabstop=2 shiftwidth=2
autocmd BufNewFile,BufRead *.swift    set filetype=swift      tabstop=4 shiftwidth=4 listchars=

"omnifunc
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType ejs        set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
autocmd FileType php        set omnifunc=phpcomplete#CompletePHP
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

" settings for leafgarland/typescript-vim
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

"omnifunc error support
setlocal omnifunc=syntaxcomplete#Complete
:map <silent> <F3> :setlocal omnifunc=syntaxcomplete#Complete<CR>

"dictionary
autocmd FileType php   set dictionary=~/.vim/dict/PHP.dict
autocmd FileType js    set dictionary=~/.vim/dict/javascript.dict
autocmd FileType scala set dictionary=~/.vim/dict/scala.dict
autocmd FileType java  set dictionary=~/.vim/dict/java.dict
autocmd FileType c     set dictionary=~/.vim/dict/c.dict
autocmd FileType cpp   set dictionary=~/.vim/dict/cpp.dict

"delete space
:map <silent> <F1> :%s /\s\+$//gc<CR>

" NeoBundle
if v:version>=702
  set nocompatible
  filetype off

  if has('vim_starting')
    set runtimepath+=~/.vim/neobundle.vim.git
  endif

  call neobundle#begin(expand('~/.bundle'))

  NeoBundle 'digitaltoad/vim-jade'
"  NeoBundle 'elzr/vim-json'
  NeoBundle 'elixir-lang/vim-elixir'
  NeoBundle 'etaoins/vim-volt-syntax'
  NeoBundle 'hhvm/vim-hack.git'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'naoty/vim-folcom'
  NeoBundle "pangloss/vim-javascript"
"  NeoBundle 'scrooloose/syntastic'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/vimfiler'
  NeoBundle 'Shougo/unite.vim'
"  NeoBundle 'Shougo/neocomplcache'
"  NeoBundle 'Shougo/neosnippet'
"  NeoBundle 'Shougo/neosnippet-snippets'
  NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
      \ 'windows' : 'make -f make_mingw32.mak',
      \ 'cygwin' : 'make -f make_cygwin.mak',
      \ 'mac' : 'make -f make_mac.mak',
      \ 'unix' : 'make -f make_unix.mak',
    \ },
  \ }
  NeoBundle 'slim-template/vim-slim'
  NeoBundle 'sudo.vim'
  NeoBundle 'tell-k/vim-autopep8'
  NeoBundle 'tpope/vim-abolish'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'thinca/vim-quickrun'
"  NeoBundle 'everzet/phpfolding.vim'
"  NeoBundle 'mattn/zencoding-vim'
"  NeoBundle 'mattn/benchvimrc-vim'
"  NeoBundle 'vim-scripts/YankRing.vim'
"  NeoBundle 'vim-scripts/FuzzyFinder'
"  NeoBundle 'vim-scripts/L9'
  NeoBundle 'toyamarinyon/vim-swift'
  NeoBundle 'Keithbsmiley/swift.vim'

  filetype plugin on
"  filetype indent on

  call neobundle#end()
endif

let g:quickrun_config = {
  \ '_' : {
  \   'runner' : 'vimproc',
  \   'runner/vimproc/updatetime' : 10,
  \ },
  \ 'vim' : {
  \   "hook/output_encode/enable" : 1,
  \   "hook/output_encode/encoding" : "utf-8",
  \ }
\ }

" " neocomplcache
" 起動時に有効化
let g:neocomplcache_enable_at_startup = 1
" 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" _(アンダースコア)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
" ポップアップメニューで表示される候補の数
let g:neocomplcache_max_list = 20
" シンタックスをキャッシュするときの最小文字長
let g:neocomplcache_min_syntax_length = 3
" ディクショナリ定義
let g:neocomplcache_dictionary_filetype_lists = {
  \ 'default' : '',
  \ 'php' : $HOME . '/.vim/dict/PHP.dict',
  \ }

if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'


" +--------+
" | vimtab |
" +--------+
  nnoremap <Space> t t
  nnoremap <Space> T T
  nnoremap t <Nop>
  nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
  nnoremap <silent> tk :<C-u>tabclose<CR>
  nnoremap <silent> tn :<C-u>tabnext<CR>
  nnoremap <silent> tp :<C-u>tabprevious<CR>

" +-----------------+
" | FuzzyFinder.vim |
" +-----------------+

  nnoremap <Space>f f
  nnoremap <Space>F F
  nnoremap f <Nop>
  nnoremap <silent> fb :<C-u>FuzzyFinderBuffer!<CR>
  nnoremap <silent> ff :<C-u>FuzzyFinderFile! <C-r>=expand('%:~:.')[:-2-len(expand('%:~:.:t'))]<CR><CR>
  nnoremap <silent> fm :<C-u>FuzzyFinderMruFile!<CR>
  nnoremap <silent> tb :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderBuffer!<CR>
  nnoremap <silent> tf :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderFile! <C-r>=expand('#:~:.')[:-2-len(expand('#:~:.:t'))]<CR><CR>
  nnoremap <silent> tm :<C-u>tabnew<CR>:tabmove<CR>:FuzzyFinderMruFile!<CR>

" +-----+
" | FZF |
" +-----+
  set rtp+=~/.fzf
  nnoremap <silent> fzf :<C-u>FZF<CR>


" " VimShell
" let g:vimshell_prompt = ' ~  '
" " nnoremap <unique> <silent> vs :<C-u>vs<CR>:<C-u>VimShell<CR><ESC>:<C-u>set nonu<CR>a
" nnoremap <silent> vs :<C-u>VimShellPop<CR><ESC>:<C-u>set nonu<CR>a
" nnoremap v <Nop>
" nnoremap s <Nop>


" VimFiler
" let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
nnoremap <silent> vf :cd %:p:h<CR>:<C-u>VimFiler -buffer-name=explorer -split -simple -winwidth=35 -toggle -no-quit<CR>

" folcom
nnoremap <silent> zc zm
nnoremap <silent> zo zr


" Move to Current Directory
nnoremap <silent> cd :cd %:p:h<CR>
" augroup group_vimrc_cd
"     autocmd!
"     autocmd BufEnter * execute ":lcd " . (isdirectory(expand("%:p:h")) ? expand("%:p:h") : "")
" augroup END

" YankRing
" nnoremap <silent> yr :<C-u>YRShow<CR>

" Char Code
" if has('iconv')
"    let s:enc_euc = 'euc-jp'
"    let s:enc_jis = 'iso-2022-jp'
"    " iconvがeucJP-msに対応しているかをチェック
"    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
"        let s:enc_euc = 'eucjp-ms'
"        let s:enc_jis = 'iso-2022-jp-3'
"    " iconvがJISX0213に対応しているかをチェック
"    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
"        let s:enc_euc = 'euc-jisx0213'
"        let s:enc_jis = 'iso-2022-jp-3'
"    endif
"    " fileencodingsを構築
"    if &encoding ==# 'utf-8'
"        let s:fileencodings_default = &fileencodings
"        let &fileencodings = s:enc_jis .','. s:enc_euc .',cp932'
"        let &fileencodings = &fileencodings .','. s:fileencodings_default
"        unlet s:fileencodings_default
"    else
"        let &fileencodings = &fileencodings .','. s:enc_jis
"        set fileencodings+=utf-8,ucs-2le,ucs-2
"        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
"            set fileencodings+=cp932
"            set fileencodings-=euc-jp
"            set fileencodings-=euc-jisx0213
"            set fileencodings-=eucjp-ms
"            let &encoding = s:enc_euc
"            let &fileencoding = s:enc_euc
"        else
"            let &fileencodings = &fileencodings .','. s:enc_euc
"        endif
"    endif
"    " 定数を処分
"    unlet s:enc_euc
"    unlet s:enc_jis
" endif

" map
map <silent> <ESC><ESC> :noh<CR>

" like shell
imap <silent> <C-a> <ESC>0i
imap <silent> <C-e> <ESC>$a
"imap <silent> <C-k> <ESC>Di

" for java
set sm
let java_highlight_all=1
let java_highlight_function="style"
let java_allow_cpp_keywords=1

" for MacVim
if has('gui_macvim')
    colorscheme peachpuff
endif

" map <silent> ts i{t}<ESC>
" map <silent> te i{/t}<ESC>
" map <silent> ta a{/t}<ESC>
"
" map <silent> tt i{t}<ESC>ea{/t}<ESC>
"
" map <silent> qq a<CR><ESC>

" for source master
:map <silent> <F2> :%s/^\d\d*\ */    '/g<CR>:%s/\ *201[45].*/',/g<CR>

" +------------+
" | neosnippet |
" +------------+

"    imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"    smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"    xmap <C-k>     <Plug>(neosnippet_expand_target)
"
"    " SuperTab like snippets behavior.
"    imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"    \ "\<Plug>(neosnippet_expand_or_jump)"
"    \: pumvisible() ? "\<C-n>" : "\<TAB>"
"    smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"    \ "\<Plug>(neosnippet_expand_or_jump)"
"    \: "\<TAB>"
"
"    " For snippet_complete marker.
"    if has('conceal')
"      set conceallevel=2 concealcursor=i
"      endif
"
"    " Enable snipMate compatibility feature.
"    let g:neosnippet#enable_snipmate_compatibility = 1
"
"    " Tell Neosnippet about the other snippets
"    let g:neosnippet#snippets_directory='~/.vim/snippets'
"
"    " use jsx syntax on .js extension
"    let g:jsx_ext_required = 0

" +----------------+
" | autocomplcahce |
" +----------------+

"    "Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
"    " Disable AutoComplPop.
"    let g:acp_enableAtStartup = 0
"    " Use neocomplcache.
"    let g:neocomplcache_enable_at_startup = 1
"    " Use smartcase.
"    let g:neocomplcache_enable_smart_case = 1
"    " Set minimum syntax keyword length.
"    let g:neocomplcache_min_syntax_length = 3
"    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
"
"    " Enable heavy features.
"    " Use camel case completion.
"    "let g:neocomplcache_enable_camel_case_completion = 1
"    " Use underbar completion.
"    "let g:neocomplcache_enable_underbar_completion = 1
"
"    " Define dictionary.
"    let g:neocomplcache_dictionary_filetype_lists = {
"        \ 'default' : '',
"        \ 'vimshell' : $HOME.'/.vimshell_hist',
"        \ 'scheme' : $HOME.'/.gosh_completions'
"            \ }
"
"    " Define keyword.
"    if !exists('g:neocomplcache_keyword_patterns')
"        let g:neocomplcache_keyword_patterns = {}
"    endif
"    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
"
"    " Plugin key-mappings.
"    inoremap <expr><C-g>     neocomplcache#undo_completion()
"    inoremap <expr><C-l>     neocomplcache#complete_common_string()
"
"    " Recommended key-mappings.
"    " <CR>: close popup and save indent.
"    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
"    function! s:my_cr_function()
"      return neocomplcache#smart_close_popup() . "\<CR>"
"      " For no inserting <CR> key.
"      "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
"    endfunction
"    " <TAB>: completion.
"    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"    " <C-h>, <BS>: close popup and delete backword char.
"    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
"    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
"    inoremap <expr><C-y>  neocomplcache#close_popup()
"    inoremap <expr><C-e>  neocomplcache#cancel_popup()
"    " Close popup by <Space>.
"    "inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() :
"    ""\<Space>"
"
"    " For cursor moving in insert mode(Not recommended)
"    "inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"    "inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"    "inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"    "inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
"    " Or set this.
"    "let g:neocomplcache_enable_cursor_hold_i = 1
"    " Or set this.
"    "let g:neocomplcache_enable_insert_char_pre = 1
"
"    " AutoComplPop like behavior.
"    "let g:neocomplcache_enable_auto_select = 1
"
"    " Shell like behavior(not recommended).
"    "set completeopt+=longest
"    "let g:neocomplcache_enable_auto_select = 1
"    "let g:neocomplcache_disable_auto_complete = 1
"    "inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"
"
"    " Enable omni completion.
"    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"
"    " Enable heavy omni completion.
"    if !exists('g:neocomplcache_force_omni_patterns')
"      let g:neocomplcache_force_omni_patterns = {}
"    endif
"    let g:neocomplcache_force_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"    let g:neocomplcache_force_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"    let g:neocomplcache_force_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
"
"    " For perlomni.vim setting.
"    " https://github.com/c9s/perlomni.vim
"    let g:neocomplcache_force_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
