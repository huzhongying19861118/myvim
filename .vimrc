"                       _                    
" _ __ ___  _   ___   _(_)_ __ ___  _ __ ___ 
"| '_ ` _ \| | | \ \ / / | '_ ` _ \| '__/ __|
"| | | | | | |_| |\ V /| | | | | | | | | (__ 
"|_| |_| |_|\__, | \_/ |_|_| |_| |_|_|  \___|
"           |___/                            
"

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible  "不使用vi默认键盘布局
filetype on "文件类型检查
filetype indent on  "不同文件类型缩进
filetype plugin on  "加载不同类型文件的插件
filetype plugin indent on
"set mouse=a
set encoding=utf-8  "编码

set clipboard=unnamed

" Prevent incorrect backgroung rendering
let &t_ut=''

" ===
" === Main code display
" ===
set number "设置行号
set relativenumber "设置相对行号
set ruler "右下角显示光标坐标
set cursorline "光标a下划线
set gcr=a:block-blinkon0 "光标不闪烁
set cursorcolumn "光标竖线
syntax enable "语法高亮
syntax on "语法高亮

" ===
" === Editor behavior
" ===
" Better tab
"set expandtab "tab转换成space
set tabstop=4 "tab = 4个space
set shiftwidth=4 "缩进宽度为４space
set softtabstop=4 "缩进宽度为４space
set list "查看特殊符号，如space tab等
set listchars=tab:▸\ ,trail:▫
set scrolloff=5 "光标上下５行

" Prevent auto line split
set wrap "不换行
set tw=0

set indentexpr=
" Better backspace
set backspace=indent,eol,start "backspace正常使用
set foldmethod=indent
set foldlevel=99 "代码缩进不折叠

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Window behaviors
" ===
set splitright "水平分屏在右边
set splitbelow "垂直分屏在下面

" ===
" === Status/command bar
" ===
set laststatus=2 "vim status 在下面２行
set autochdir "工作目录跟着打开文件走
set showcmd "显示命令
set showmode "显示当前的模式
set formatoptions-=tc
"set cindent "c语言缩进
" Show command autocomplete
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu "输入命令可以用tab模糊匹配
set wildmode=longest,list,full "模糊匹配的方法

" Searching options
set hlsearch "搜索高亮
exec "nohlsearch"
set incsearch "搜索自动匹配
set ignorecase "搜索忽略大小写
set smartcase "智能搜索


" ===
" === Restore Cursor Position
" ===
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


" ===
" === Basic Mappings
" ===

" Set <LEADER> as <SPACE>
let mapleader=" "

" Column (:) mods
map ; :
map q; q:
map <LEADER>/ :!
map <LEADER>r :r !
map <LEADER>sr :%s/

" Save & quit
map Q :q<CR>
map S :w<CR>
" Open the vimrc file anytime
map <LEADER>rc :e ~/.vimrc<CR>


"ban up down left right 
nnoremap <Up> :echomsg "Use k"<cr>
nnoremap <Down> :echomsg "Use j"<cr>
nnoremap <Left> :echomsg "Use h"<cr>
nnoremap <Right> :echomsg "Use l"<cr>

" Copy to system clipboard
vnoremap Y :w !xclip -i -sel c<CR>

" Search
map <LEADER><CR> :nohlsearch<CR>
noremap = nzz
noremap - Nzz

" Duplicate words
map <LEADER>fd /\(\<\w\+\>\)\_s*\1

" Others
map <LEADER>o o<Esc>u

" U/E keys for 5 times u/e (faster navigation)
noremap K 5k
noremap J 5j
" N key: go to the start of the line
noremap H 0
" I key: go to the end of the line
noremap L $

"capslock to esc
noremap <> <ESC>


"====
"====clipboard
"====
noremap <LEADER>y "+y
noremap <LEADER>p "+p


" ===
" ===buffer management
" ===
map bn :bnext<CR>
map bp :bNext<CR>
map bf :bfirst<CR>
map bl ;blast<CR>

map bdo :call BufCloseOthers()<CR>
func! BufCloseOthers()
	let l:currentBufNum = bufnr("%")
	let l:alternateBufNum = bufnr("#")
	for i in range(1,bufnr("$"))
		if buflisted(i)
			if i!=l:currentBufNum
				execute("bdelete".i)
			endif
		endif
	endfor
endfunc

" === Window management
" ===
" Use <space> + new arrow keys for moving the cursor around windows
map <LEADER>w <C-w>w
map <LEADER>k <C-w>k
map <LEADER>j <C-w>j
map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
"map <LEADER>r <C-w>r

" Disabling the default s key
noremap s <nop>

" split the screens to up (horizontal), down (horizontal), left (vertical), right (vertical)
map sk :set nosplitbelow<CR>:split<CR>:set splitbelow<CR>
map sj :set splitbelow<CR>:split<CR>
map sh :set nosplitright<CR>:vsplit<CR>:set splitright<CR>
map sl :set splitright<CR>:vsplit<CR>

" Resize splits with arrow keys
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize-5<CR>
map <right> :vertical resize+5<CR>

" Place the two screens up and down
noremap ss <C-w>t<C-w>K

" Place the two screens side by side
noremap sv <C-w>t<C-w>H

" Rotate screens
noremap srh <C-w>b<C-w>K
noremap srv <C-w>b<C-w>H


" ===
" === Tab management
" ===
" Create a new tab with tu
map tk :tabe<CR>
" Move around tabs with tn and ti
map th :-tabnext<CR>
map tl :+tabnext<CR>
" Move the tabs with tmn and tmi
map tmh :-tabmove<CR>
map tml :+tabmove<CR>


" ===
" === Other useful stuff
" ===

" Press space twice to jump to the next '<++>' and edit it
map <LEADER><LEADER> <Esc>/<++><CR>:nohlsearch<CR>c4i

" Spelling Check with <space>sc
map <LEADER>sc :set spell!<CR>
noremap <C-x> ea<C-x>s
inoremap <C-x> <Esc>ea<C-x>s

" Press ` to change case (instead of ~)
map ` ~

imap <C-c> <Esc>zza
nmap <C-c> zz

" Auto change directory to current dir
autocmd BufEnter * silent! lcd %:p:h

" Call figlet
map tx :r !figlet 

" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    silent! exec "!clear"
    exec "!time python3 %"
  elseif &filetype == 'html'
    exec "!firefox % &"
  elseif &filetype == 'markdown'
    exec "MarkdownPreview"
  elseif &filetype == 'vimwiki'
    exec "MarkdownPreview"
  endif
endfunc

map R :source $MYVIMRC<CR>
"map R :call CompileBuildrrr()<CR>
if !exists("*CompileBuildrrr")
  func! CompileBuildrrr()
    exec "w"
    if &filetype == 'vim'
      exec "source $MYVIMRC"
    elseif &filetype == 'markdown'
      exec "echo"
    endif
  endfunc
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')



Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mkitt/tabline.vim'
Plug 'bling/vim-bufferline'
Plug 'mhinz/vim-startify'
Plug 'kien/rainbow_parentheses.vim'
" File navigation
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim', { 'on': 'CtrlP' }
" Make sure you use single quotes

Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
"airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

"tabline configuration
hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" ===
" === Dress up my vim
" ===
set termguicolors     " enable true colors support
set background=dark
"colorscheme molokai
" ===

"===
"=== rainbow
"===
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au Syntax * RainbowParenthesesLoadChevrons
" === NERDTree
" ===
map tp :NERDTreeTabsToggle<CR>
map tt :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
let NERDTreeMapOpenExpl = ""
let NERDTreeMapUpdir = ""
let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = ""
let NERDTreeOpenVSplit = ""
let NERDTreeMapActivateNode = "i"
let NERDTreeMapOpenInTab = "o"
let NERDTreeMapPreview = ""
let NERDTreeMapCloseDir = "n"
let NERDTreeMapChangeRoot = "y"
" 显示行号
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" 是否显示隐藏文件
let NERDTreeShowHidden=1
" 设置宽度
let NERDTreeWinSize=22
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
"let g:nerdtree_tabs_smart_startup_focus=2
" 忽略一下文件的显示
"let NERDTreeIgnore=['\.pyc','\~$','\.swp']
" 显示书签列表
let NERDTreeShowBookmarks=1
let g:nerdtree_tabs_autofind=1

" Autorefresh on tree focus
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

" ===
" === CtrlP
" ===
map <C-p> :CtrlP<CR>