set number "行番号を表示する
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース4つ分に設定
set shiftwidth=2 "自動インデントでずれる幅
set smartindent "オートインデント
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える

" ファイル処理関連の設定

set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る

"html閉じタグ補完 </
autocmd FileType html inoremap <silent> <buffer> </ </<C-x><C-o>

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
"unite general settings
""インサートモードで開始
"let g:unite_enable_start_insert = 1
"最近開いたファイル履歴の保存数
let g:unite_source_file_mru_limit = 50
"
""file_mruの表示フォーマットを指定。空にすると表示スピードが高速化される
let g:unite_source_file_mru_filename_format = ''

"現在開いているファイルのディレクトリ下のファイル一覧。
""開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"バッファ一覧
nnoremap <silent> [unite]b :<C-u>Unite buffer<CR>
""レジスタ一覧
nnoremap <silent> [unite]r :<C-u>Unite -buffer-name=register register<CR>
"最近使用したファイル一覧
nnoremap <silent> [unite]m :<C-u>Unite file_mru<CR>
""ブックマーク一覧
nnoremap <silent> [unite]c :<C-u>Unite bookmark<CR>
"ブックマークに追加
nnoremap <silent> [unite]a :<C-u>UniteBookmarkAdd<CR>
""uniteを開いている間のキーマッピング
autocmd FileType unite call s:unite_my_settings()
		function! s:unite_my_settings()"{{{"ESCでuniteを終了
		nmap <buffer> <ESC> <Plug>(unite_exit)
		"入力モードのときjjでノーマルモードに移動
		imap <buffer> jj <Plug>(unite_insert_leave)
		"入力モードのときctrl+wでバックスラッシュも削除
		imap <buffer> <C-w> <Plug>(unite_delete_backward_path)
		"ctrl+jで縦に分割して開く
		nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
		inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
		"ctrl+jで横に分割して開く
		nnoremap <silent> <buffer> <expr> <C-l>	unite#do_action('vsplit')
		inoremap <silent> <buffer> <expr> <C-l>	unite#do_action('vsplit')
		"ctrl+oでその場所に開く
		nnoremap <silent> <buffer> <expr> <C-o>	unite#do_action('open')
		inoremap <silent> <buffer> <expr> <C-o>	unite#do_action('open')
		endfunction"}}}
"-------------------------------------------
"html.vim
"-------------------------------------------
let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
"-------------------------------------------
"neocomplcache
"-------------------------------------------
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
"候補確定
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
