" ---------------------------------------------
" plugin lists
" ---------------------------------------------
call plug#begin()

" editor
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'haya14busa/vim-edgemotion'
Plug 'AndrewRadev/switch.vim'
Plug 'tomtom/tcomment_vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'machakann/vim-sandwich'
Plug 'Townk/vim-autoclose'
Plug 'terryma/vim-multiple-cursors'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ide
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'junegunn/fzf.vim'
Plug 'simeji/winresizer'
Plug 'ryanoasis/vim-devicons'
Plug 'osyo-manga/vim-brightest'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'
" Plug 'Shougo/neocomplcache'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" markdown
Plug 'plasticboy/vim-markdown'
Plug 'previm/previm'
Plug 'tyru/open-browser.vim'
Plug 'dhruvasagar/vim-table-mode'

" git
Plug 'tpope/vim-fugitive'

" other
Plug 'mattn/webapi-vim'

Plug 'eshion/vim-sync'
Plug 'vim-scripts/dbext.vim'
Plug 'vim-scripts/VimRepress'
Plug 'vim-scripts/AnsiEsc.vim'

Plug 'everzet/phpfolding.vim'
Plug 'mattn/sonictemplate-vim'

Plug 'hashivim/vim-terraform'

Plug 'mattn/gist-vim'
Plug 'tsuyoshiwada/slack-memo-vim'

Plug 'mfukar/robotframework-vim'
Plug 'adi/vim-indent-rainbow'

Plug 'github/copilot.vim'
Plug 'wakatime/vim-wakatime'

call plug#end()


" ---------------------------------------------
" plugin settings
" ---------------------------------------------
" Plugin: webapi-vim
"   Vimから、HTTPのPOSTやGETができる、非常に便利なプラグイン
" Plugin: Emmet
"   HTMLやCSSの構造を簡略化して書くプラグイン [C-y]
" Plugin: vim-autoclose
"   括弧を自動で閉じるプラグイン
" Plugin: tcomment_vim
"   複数行コメントのトグル ノーマルモードで[gcc]、ビジュアルモードで[gc]
" Plugin: vim-sync
"   sftpで自動アップロード [\su]:upload [\sd]:download
" Plugin: VimRepress
"   vimでWordpress管理
" Plugin: sonictemplate-vim
"   vimでテンプレート管理
" Plugin: vim-wakatime
"   WakaTime
" Plugin: phpfolding
"   php関数の折りたたみ
" Plugin: AnsiEsc.vim [\as]:AnsiEsc
"   vimでANSI colorを表示する

" Plugin: neocomplcache
"   dark power
let g:neocomplcache_enable_at_startup = 1

" Plugin: NERDTree
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 30
map <Leader>n :NERDTreeToggle<CR>

" Plugin: tagbar
"   どの関数内にいるか右ペインに表示
let g:tagbar_width = 30
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
if !exists('g:tagbar_autoshowtag')
    let g:tagbar_autoshowtag = 0
endif
map <Leader>b :Tagbar<CR>

" Plugin: fzf.vim
set rtp+=~/.fzf
map <Leader>f :FZFFileList<CR>
command! FZFFileList call fzf#run({
            \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store',
            \ 'sink': 'tabe'})

" Plugin: fugitive
"   vim用のgitラッパープラグイン
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}
autocmd VimLeave *
      \ if exists('b:git_dir') && !empty(glob(b:git_dir.'/hooks/ctags')) |
      \   call system('"'.b:git_dir.'/hooks/ctags" &') |
      \ endif

map <Leader>tg :!tig<CR>
map <Leader>rg :!rg 

map <Leader>tp :!tp<CR>
map <Leader>ta :!ta<CR>

" Plugin: vim-easymotion
"   Vimのカーソル移動を爆速化 [s]
nmap S <Plug>(easymotion-s2)
nmap T <Plug>(easymotion-t2)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" Plugin: vim-edgemotion
"   Vimのカーソル移動を爆速化 [s]
nmap <C-j> <Plug>(edgemotion-j)
nmap <C-k> <Plug>(edgemotion-k)

" Plugin: Switch.vim
"   文字列リテラルをトグル [+][-]
" switch {{{
nmap + :Switch<CR>
nmap - :Switch<CR>
" }}}
let g:switch_custom_definitions =
\ [
\   ['foo', 'bar'],
\   ['asc', 'desc'],
\   ['public', 'private'],
\   ['post', 'get'],
\   ['js', 'css'],
\   ['if', 'unless'],
\   ['from', 'to'],
\   ['<', '>', '='],
\ ]

" Plugin: vim-trailing-whitespace
"   末尾の不要な半角スペースを削除する [:FixWhitespace]
let g:extra_whitespace_ignored_filetypes = ['calendar']
nnoremap <Leader>ws :FixWhitespace<CR>
inoremap <Leader>ws <ESC>:FixWhitespace<CR>i

" Plugin: lightline.vim
"   ステータスバー拡張
" fugitive.vimから現在のGitブランチ名を取得
function MyFugitiveHead()
  let head = FugitiveHead()
  if head != ""
    let head = "\uf126 " .. head
  else
    let head = "\uf126 " .. '[No Git Repo]'
  endif
  return head
endfunction
" AWS_PROFILEを表示
function! LightlineAwsProfile() abort
  let aws_profile = getenv('AWS_PROFILE')
  if !empty(aws_profile)
    return aws_profile
  else
    return '[No AWS Profile]'
  endif
endfunction
let g:lightline = {
      \ 'colorscheme': 'landscape',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'gitbranch', 'aws_profile', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'MyFugitiveHead',
      \   'aws_profile': 'LightlineAwsProfile'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }
set laststatus=2

" Plugin: vim-multiple-cursors
"   Sublime風編集コマンド
let g:multi_cursor_start_key='<C-o>'
let g:multi_cursor_next_key='<C-o>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Plugin: Vimの「%」を拡張する（Vim同梱プラグイン）
source $VIMRUNTIME/macros/matchit.vim

" Plugin: dbext
"   DB接続
source ~/.vim/dbext/$DBEXT.dbext

" Plugin: vim table mode
"   [\tm]:ON/OFF [||]:表作成開始
let g:table_mode_corner = '|'

" Plugin: winresizer
"   分割サイズ調整 [C-e]
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" Plugin: vim-markdown
" Plugin: previm
" Plugin: open-browser.vim
"   Markdown編集環境
au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'google-chrome --no-sandbox ~/vim/.vim/plugged/previm/preview/index.html &'
"let g:previm_open_cmd = 'open -a "/Applications/Google Chrome.app" ~/.vim/pack/foo/start/previm/preview/index.html &'
let g:vim_markdown_folding_disabled=1

" Plugin: gist-vim
"   Gistでスニペット管理
let g:gist_curl_options = "-k"
let g:gist_detect_filetype = 1

" Plugin: slack-memo-vim
"   Slackでメモ管理
let g:slack_memo_token = $SLACK_MEMO_TOKEN
let g:slack_memo_channel = $SLACK_MEMO_CHANNEL
" map <C-l> :SlackMemoPost<CR>

" Plugin: php_localvarcheck
"   php: 未使用変数をハイライト
let g:php_localvarcheck_enable = 1
let g:php_localvarcheck_global = 0

" Plugin: editorconfig-vim
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Plugin: 'hashivim/vim-terraform'
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1


" Plugin: 'prabirshrestha/vim-lsp'
setlocal signcolumn=no

" Plugin: 'github/copilot'
imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true
imap <silent><script><expr> <M-]> copilot#Next()
imap <silent><script><expr> <M-[> copilot#Previous()

" Plugin: 'peitalin/vim-jsx-typescript'
" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" 'prettier/vim-prettier', (Needs: npm install -g prettier')
augroup fmt
  autocmd!
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.svelte,*.yaml,*.html PrettierAsync
augroup END

" Plug 'adi/vim-indent-rainbow'
call togglerb#map("<Leader>rb")

" ---------------------------------------------
" vim settings
" ---------------------------------------------
" encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932,euc-jp
set fileformats=unix,dos,mac
scriptencoding utf-8

" colorscheme
colorscheme lucius
set background=dark
set t_Co=256

" コメントの色
" hi Comment ctermfg=black
" hi Comment ctermbg=gray
highlight Comment ctermbg=NONE guibg=NONE

" editor
syntax on
set synmaxcol=200
set number              " 行番号
set noswapfile          " スワップファイルを作成しない
set cursorline          " カーソル行の背景色を変更
set wildmenu            " コマンドモードの補完
set history=500         " 保存するコマンド履歴の数
set ambiwidth=double    " ○△→などを2バイトで表示する

" カーソルを行頭、行末で止まらないようにする
" set whichwrap=b,s,h,l,<,>,[,]

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" 通常モード中に素早くqqと入力した場合は保存せずに閉じる
nnoremap qq :q<CR>

" 通常モード中に素早くwqqと入力した場合は保存して閉じる
nnoremap wqq :wq<CR>

" タブ移動
nmap <Tab>      gt
nmap <S-Tab>    gT

" 分割移動
map <Leader>ww <C-w>w

" マウス設定
" set mouse-=a
" set ttymouse=xterm2

" ビープ音を消す
set visualbell

" エイリアス設定
let $BASH_ENV = "~/.vimaliases"

" netrw設定
let g:netrw_liststyle = 3

" ペーストモードの切り替え
set pastetoggle=<F2>

" 行番号の切り替え
nnoremap <F3> :set invnumber<CR>

" 現在時刻を挿入[C-o][C-o]
nmap <C-o><C-o> <ESC>i<C-r>=strftime("%Y-%m-%d %H:%M:%S")<CR><CR>

" SQL整形(要sql-formatter)
xnoremap <Leader>sq :!sql-formatter<CR>

" 編集再開位置を保持
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" カッコの強調色を調整
hi MatchParen ctermbg=2

" 画面のフラッシュを止める
set visualbell t_vb=

" 空白やハードタブを可視化
" tab:タブ、trail:行末のスペース、eol:改行、extends:画面外（右）、precedes:画面外（左）
set list
set listchars=tab:»-,extends:»,precedes:«,nbsp:%
" set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 検索文字列をハイライト
set hls
nnoremap <Esc><Esc> :<C-u>set nohlsearch<Return>
nnoremap <Leader>/ :<C-u>set hlsearch<Return>/
nnoremap ? :<C-u>set hlsearch<Return>?
nnoremap * :<C-u>set hlsearch<Return>*
nnoremap # :<C-u>set hlsearch<Return>#

" ANSI colorの表示/非表示を切り替え[\as]
nnoremap <Leader>as :AnsiEsc<Return>

" 補完ウィンドウの設定
set completeopt=menuone,noinsert

" ソフトタブとハードタブを相互変換
" call Retab2Hard():ソフトタブをハードタブへ変換
" call Retab2Soft():ハードタブをソフトタブへ変換
function! Retab2Hard()
    :set noexpandtab
    :retab!
endfunction
function! Retab2Soft()
    :set expandtab
    :retab!
endfunction
command! Retab2Hard :call Retab2Hard()
command! Retab2Soft :call Retab2Soft()

" 補完表示時のEnterで改行をしない
inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

set completeopt=menuone,noinsert
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"
