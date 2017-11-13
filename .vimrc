set nocompatible
set ic
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set cindent
set smartindent
set expandtab
set t_Co=256
set clipboard=unnamed,autoselect
set guioptions+=a
set fileencoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileformat=unix
set fileformats=unix,dos,mac

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
nnoremap <silent> g? #:Ag! <cword><cr>
nnoremap <silent> <C-q> :QuickRun<cr>
nnoremap <C-x> :QuickRun<cr>
nnoremap <C-q> :QuickRun<cr>

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

  "
  " NeoBundle
  "
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc'
  NeoBundle 'Shougo/vimshell'
  NeoBundle 'Shougo/unite.vim'

  "
  " Syntax
  "
  "NeoBundle 'scrooloose/syntastic'
  NeoBundle 'w0rp/ale'
  NeoBundle 'thinca/vim-quickrun'
  NeoBundle 'nathanaelkane/vim-indent-guides'

  "
  " Completion
  "
  NeoBundle 'ervandew/supertab'

  "
  " Tree
  "
  NeoBundle 'scrooloose/nerdtree'

  "
  " Perl
  "
  " NeoBundle 'petdance/vim-perl'
  " NeoBundle 'hotchpotch/perldoc-vim'
  " NeoBundle 'c9s/perlomni.vim'
  " NeoBundle 'vim-perl/vim-perl'

  "
  " PHP
  "
  " NeoBundle 'm2mdas/phpcomplete-extended'

  "
  " Browser
  "
  "NeoBundle 'tyru/open-browser.vim'
  "NeoBundle 'tell-k/vim-browsereload-mac'

  "NeoBundle 'nginx.vim'
  "NeoBundle 'tpope/vim-markdown'
  "NeoBundle 'plasticboy/vim-markdown'

  "
  " Web
  "
  " NeoBundle 'MatchTag'
  " NeoBundle 'vim-scripts/matchit.zip'
  " NeoBundle 'hail2u/vim-css3-syntax'
  " NeoBundle 'mattn/emmet-vim'
  " NeoBundle 'mattn/webapi-vim'

  "
  " JS
  "
  " NeoBundle 'jQuery'
  " NeoBundle 'michalliu/jsruntime'
  NeoBundle 'othree/yajs.vim'
  NeoBundle 'JavaScript-syntax'
  NeoBundle 'pangloss/vim-javascript'
  NeoBundle 'jelera/vim-javascript-syntax'
  NeoBundle 'pmsorhaindo/syntastic-local-eslint.vim'

  "
  " Coffee Script
  "
  "NeoBundle 'kchmck/vim-coffee-script'
  "NeoBundle 'kannokanno/previm'

  "
  "  Ruby
  "
  " NeoBundle 'slim-template/vim-slim'

  "
  " TypeScript
  "
  " NeoBundle 'leafgarland/typescript-vim'
  " NeoBundle 'HerringtonDarkholme/yats.vim'
  " NeoBundle 'Quramy/tsuquyomi'
  " NeoBundle 'clausreinke/typescript-tools.vim'

  "
  " React Jsx
  "
  NeoBundle 'mxw/vim-jsx'
  " NeoBundle 'othree/yajs'

  "
  " Color Scheme
  "
  NeoBundle 'jpo/vim-railscasts-theme'
  "NeoBundle 'tomasr/molokai'
  "NeoBundle 'Lokaltog/vim-distinguished'
  "NeoBundle 'morhetz/gruvbox'
  "NeoBundle 'w0ng/vim-hybrid'
  "NeoBundle 'nanotech/jellybeans.vim'
  "NeoBundle 'vim-scripts/twilight'
  "NeoBundle 'jonathanfilip/vim-lucius'
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
  NeoBundle 'Townk/vim-autoclose'
  NeoBundle 'jiangmiao/auto-pairs'

  "
  " MarkDown
  "
  "NeoBundle 'suan/vim-instant-markdown'

call neobundle#end()

NeoBundleCheck


filetype plugin indent on
syntax enable
colorscheme railscasts


"NeoBundle 'VimClojure'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'jpalardy/vim-slime'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
"NeoBundle 'https://github.com/leafgarland/typescript-vim.git'
"NeoBundle 'https://github.com/clausreinke/typescript-tools.git'
"NeoBundle 'taichouchou2/vim-javascript'
"NeoBundle 'vim-scripts/AutoComplPop'
"NeoBundle 'cakebaker/scss-syntax.vim'
"NeoBundle 'AtsushiM/sass-compile.vim'


" Eslint
let g:syntastic_javascript_checkers=['eslint']
" let g:jsx_ext_required = 0

" Coffee Script
" let coffee_lint_options = '-f lint.json'

" autocmd BufRead,BufNewFile,BufReadPre *.coffee set filetype=coffee
" autocmd FileType coffee setlocal sw=2 sts=2 ts=2 et
" autocmd BufNewFile,BufRead *.coffee let @@ = "CoffeeCompile"
" autocmd BufNewFile,BufRead *.coffee let @c = "CoffeeCompile"
"autocmd BufWritePost *.coffee silent make!
"autocmd QuickFixCmdPost * nested cwindow | redraw!
" Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
"nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

"
" Markdown
"
" autocmd BufRead,BufNewFile *.md set filetype=markdown
" let g:markdown = 'open -a Chrome'

"
" QuickRun
"
let g:quickrun_config={'*': {"outputter/buffer/split" : ":above 8sp"}}

"
" Grep
"
autocmd QuickFixCmdPost *grep* cwindow
autocmd QuickFixCmdPost gr* cwindow

"
" Completion
"
"setlocal omnifunc=syntaxcomplete#Complete

" autocmd FileType php setlocal omnifunc=phpcomplete_extended#CompletePHP
" let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

filetype plugin on
set omnifunc=syntaxcomplete#Complete

"
" Syntastic ON
"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
