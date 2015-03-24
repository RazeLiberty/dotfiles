set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=4 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る

"#####検索設定#####
set hlsearch   " 検索文字列をハイライトする
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る

"カラースキーマを設定
"colorscheme solarized
"let g:solarized_termcolors=256
"syntax on
"set background=dark
let g:hybrid_use_iTerm_colors = 1
colorscheme hybrid
syntax on
"---------------------------
" Start Neobundle Settings.
"---------------------------
" bundleで管理するディレクトリを指定
set runtimepath+=~/.vim/bundle/neobundle.vim/
 
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))
 
	" neobundle自体をneobundleで管理
	NeoBundleFetch 'Shougo/neobundle.vim'
	
	"---plugins---
	NeoBundle 'Shougo/neobundle.vim'     " バンドル管理ツール
	NeoBundle 'Shougo/unite.vim'
	NeoBundle 'Shougo/neomru.vim'
	NeoBundle 'Shougo/vimproc.vim', {
							\ 'build' : {
							\     'windows' : 'tools\\update-dll-mingw',
							\     'cygwin' : 'make -f make_cygwin.mak',
							\     'mac' : 'make -f make_mac.mak',
							\     'linux' : 'make',
							\     'unix' : 'gmake',
							\    },
							\ }
	NeoBundle 'Shougo/neocomplcache.vim' "補完
	NeoBundle 'Shougo/neosnippet'
	NeoBundle 'Shougo/neosnippet-snippets'
	NeoBundle 'itchyny/lightline.vim'
	NeoBundle 'scrooloose/nerdtree'	"ディレクトリツリー
	
	"-- web coding --
	NeoBundle 'mattn/emmet-vim'	"zen coding
	NeoBundle 'surround.vim'	"vimのテキストオブジェクトを拡張
	NeoBundle 'open-browser.vim'	"open URL and can search
	NeoBundle 'hail2u/vim-css3-syntax'	"syntax
	NeoBundle 'lilydjwg/colorizer' "hex color display
    NeoBundle 'AtsushiM/search-parent.vim'
	NeoBundle 'AtsushiM/sass-compile.vim'
	NeoBundle 'vim-javascript'
	NeoBundle 'taichouchou2/html5.vim'
    
call neobundle#end()
	 
" Required:
filetype plugin indent on
	  
" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck
	   
"-------------------------
" End Neobundle Settings.
"-------------------------
"-------------------------------
"" emmet-vim
"-------------------------------
let g:user_emmet_settings = {
    \    'variables': {
    \      'lang': "ja"
    \    },
    \   'indentation': '  '
    \ }

"------------------------------------
"" sass
"------------------------------------
"""{{{
let g:sass_compile_auto = 1
let g:sass_compile_cdloop = 5
let g:sass_compile_cssdir = ['css', 'stylesheet']
let g:sass_compile_file = ['scss', 'sass']
let g:sass_compile_beforecmd = ''
let g:sass_compile_aftercmd = ''
"}}}
"------------------------------------
"" vim-browsereload-mac
"------------------------------------
let g:returnApp = "iTerm"

"------------------------------------
"" open-browser
"------------------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"---------------------------------------------------
" NERDTree
"----------------------------------------------------

"Ctrl+e start nerdtreetoggle
nnoremap <silent><C-n> :NERDTreeToggle<CR>
"nnoremap <C-t> gt
"nnoremap <C-p> gT 
"nnoremap <silent><C-c> :closetab


" 隠しファイルを表示する
let NERDTreeShowHidden = 1

"引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
		  autocmd VimEnter * execute 'NERDTree ./'
		  endif

"----------------------------------    -----------------
" browser auto reload command
"----------------------------------    ------------------
imap <C-G> <ESC>:w<CR>:!osascript /Users/HappyPrince/dotfiles/.vim/reload_browser.scpt<CR><CR>a
nmap <C-G> :w<CR>:!osascript /Users/HappyPrince/dotfiles/.vim/reload_browser.scpt<CR><CR>

"----------------------------------    -----------------
" unite
"-------------------------------------------------------
"
