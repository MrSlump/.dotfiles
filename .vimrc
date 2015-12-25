set nocompatible
set ic
set number
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set cindent
set smartindent
set expandtab
set t_Co=256
"set clipboard=unnamedplus,autoselect
set clipboard=unnamed,autoselect
set guioptions+=a
"set fileencoding=utf-8
"set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
"set fileformat=unix
set hlsearch
set expandtab

set imdisable
set iminsert=0
set imsearch=0

set wildmode=longest:full,full
set wildmode=longest:list,full
set wildmode=list,full

noremap <Enter> o<ESC>
nnoremap <silent> g/ *:Ag! <cword><cr>
nnoremap <silent> g? *:Ag! <cword><cr>

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimshell'

  "
  " Syntax
  "
  "NeoBundle 'petdance/vim-perl'
  "NeoBundle 'hotchpotch/perldoc-vim'
  "NeoBundle 'c9s/perlomni.vim'
  "NeoBundle 'vim-perl/vim-perl'
  "NeoBundle 'JavaScript-syntax'
  "NeoBundle 'jQuery'
  "NeoBundle 'nginx.vim'
  "NeoBundle 'tpope/vim-markdown'
  "NeoBundle 'scrooloose/syntastic'
  "NeoBundle 'scrooloose/syntastic'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'nathanaelkane/vim-indent-guides'

  NeoBundle 'MatchTag'
  NeoBundle 'vim-scripts/matchit.zip'

  "NeoBundle 'mattn/emmet-vim'
  "NeoBundle 'mattn/webapi-vim'
  "NeoBundle 'taichouchou2/html5.vim'
  "NeoBundle 'pangloss/vim-javascript'
  "NeoBundle 'open-browser.vim'
  "NeoBundle 'tell-k/vim-browsereload-mac'
  "NeoBundle 'hail2u/vim-css3-syntax'

  NeoBundle 'kchmck/vim-coffee-script'

  " NeoBundle 'taichouchou2/html5.vim'
  "NeoBundle 'plasticboy/vim-markdown'
  "NeoBundle 'kannokanno/previm'
  "NeoBundle 'tyru/open-browser.vim'

  "
  " Color Scheme
  "
  NeoBundle 'jpo/vim-railscasts-theme'
  "NeoBundle 'w0ng/vim-hybrid'
  "NeoBundle 'nanotech/jellybeans.vim'
  "NeoBundle 'vim-scripts/twilight'
  "NeoBundle 'jonathanfilip/vim-lucius'
  "NeoBundle 'tomasr/molokai'


  "NeoBundle 'altercation/vim-colors-solarized'
  "NeoBundle 'vim-scripts/Wombat'
  "NeoBundle 'vim-scripts/rdark'


  "
  " Tmux
  "
  NeoBundle 'christoomey/vim-tmux-navigator'

  " Search
  NeoBundle 'rking/ag.vim'

  " save session
  NeoBundle 'tpope/vim-obsession'

  " command UF Unite file
  "NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'
  NeoBundle 'Shougo/neocomplcache'

  " Closer
  "NeoBundle 'Townk/vim-autoclose'
  "NeoBundle 'jiangmiao/auto-pairs'

  "NeoBundle 'othree/vim-autocomplpop'
  NeoBundle 'suan/vim-instant-markdown'

call neobundle#end()

NeoBundleCheck


filetype plugin indent on
syntax enable
colorscheme railscasts

"NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'scrooloose/syntastic'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
"NeoBundle 'https://github.com/clausreinke/typescript-tools.git'
"NeoBundle 'taichouchou2/vim-javascript'
"NeoBundle 'vim-scripts/AutoComplPop'
"NeoBundle 'cakebaker/scss-syntax.vim'
"NeoBundle 'AtsushiM/sass-compile.vim'


" Coffee Script
let coffee_lint_options = '-f lint.json'

autocmd BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
autocmd BufNewFile,BufRead *.coffee let @@ = "CoffeeCompile"
autocmd BufNewFile,BufRead *.coffee let @c = "CoffeeCompile"
"autocmd BufWritePost *.coffee silent make! 
"autocmd QuickFixCmdPost * nested cwindow | redraw! 
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
"nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

"
" Markdown
"
autocmd BufRead,BufNewFile *.md set filetype=markdown
let g:markdown = 'open -a Chrome'

"
" QuickRun
"
let g:quickrun_config={'*': {"outputter/buffer/split" : ":botright 8sp"}}

"
" Grep
"
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost gr* cwindow

"
" Completion
"
"setlocal omnifunc=syntaxcomplete#Complete
