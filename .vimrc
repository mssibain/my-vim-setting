" neobundle settings {{{
if has('vim_starting')
  set nocompatible
  " neobundle をインストールしていない場合は自動インストール
  if !isdirectory(expand("~/.vim/bundle/neobundle.vim/"))
    echo "install neobundle..."
    " vim からコマンド呼び出しているだけ neobundle.vim のクローン
    :call system("git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim")
  endif
  " runtimepath の追加は必須
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle'))
let g:neobundle_default_git_protocol='https'

" neobundle#begin - neobundle#end の間に導入するプラグインを記載します。
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'w0ng/vim-hybrid'

NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }

" vimrc
" に記述されたプラグインでインストールされていないものがないかチェックする
NeoBundleCheck
call neobundle#end()
filetype plugin indent on

"円コーディングの指定
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932

"タブの設定（タブ4文字文&タブ(\t)ではなくスペースの挿入）"
set tabstop=4
set sw=4
set expandtab

"2バイト文字対策
set ambiwidth=double

"エンコーディングの設定
set encoding=utf8

"カレントバッファ内の文字エンコーディングの指定
set fileencoding=utf8

"カーソルの上下に表示する最小限の行数
set scrolloff=5

"ビープ音を鳴らさない
set vb t_vb=

"バックスペースでインデントの消去可能"
set backspace=indent,eol,start

"かっこで対応するかっこにカーソルを移す"
set showmatch

"検索の設定（小文字のみだと大小区別なし&随時検索）"
set ignorecase
set smartcase
set incsearch

"検索を行頭へ自動ループしない
set nowrapscan

"行番号の表示"
set number

"自動的にインデントを調節する(java)"
"set cindent
"set indentexpr

augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END

"ESCキー連打で検索ハイライト消去"
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"カーソルの表示行移動。
"物理行移動は<C-p>,<C-n>
nmap <Down> gj
nmap <Up>   gk
imap <Down>     <Esc>gja
imap <Up>       <Esc>gka

"カーソル行頭から前行末への移動
"set whichwrap=b,s,h,l,<,>,[,]

"全角スペースの視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"let g:hybrid_use_Xresources = 1
set background=dark
"colorscheme hybrid
syntax on
