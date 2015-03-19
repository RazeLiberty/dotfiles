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
colorscheme solarized
let g:solarized_termcolors=256
syntax on
set background=dark

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
	"NeoBundle 'Shougo/vimproc' "非同期実行可能になる
	"NeoBundle 'Shougo/neocomplete' "補完
	NeoBundle 'scrooloose/nerdtree'	"ディレクトリツリー
	"-- web coding --
	NeoBundle 'mattn/emmet-vim'	"zen coding
	NeoBundle 'taichouchou2/surround.vim'	"vimのテキストオブジェクトを拡張
	NeoBundle 'open-browser.vim'	"open URL and can search
	NeoBundle 'tell-k/vim-browsereload-mac'	"保存時ブラウザ自動更新
	NeoBundle 'hail2u/vim-css3-syntax'	"syntax
	NeoBundle 'lilydjwg/colorizer' "hex color display
	NeoBundle 'taichouchou2/vim-javascript'
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

"----------------------------------------------------
" NERDTree
"----------------------------------------------------

"Ctrl+e start nerdtreetoggle
nnoremap <silent><C-e> :NERDTreeToggle<CR>
nnoremap <C-n> gt
nnoremap <C-p> gT 
nnoremap <C-c> :closetab
" 隠しファイルを表示する
let NERDTreeShowHidden = 1
"引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
		  autocmd VimEnter * execute 'NERDTree ./'
		  endif
