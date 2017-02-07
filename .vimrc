" So long vundle, we shall now use plug since yarn
" showed me the power of parallel package installation
call plug#begin('~/.vim/bundle')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'gregsexton/MatchTag'
Plug 'lebibin/dracula-vim'
Plug 'lilydjwg/colorizer'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'pbrisbin/vim-mkdir'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'suan/vim-instant-markdown'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/nginx.vim'
Plug 'vim-scripts/AutoClose'
Plug 'wakatime/vim-wakatime'

" Initialize plugin system
call plug#end()

" Use Vim settings, rather than Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible
filetype off

set encoding=utf8

set autowrite
set autoread
set history=50
set laststatus=2  " Always display status line
set linespace=2
set nobackup
set nowritebackup
set noswapfile
set ruler         " Show the cursor position all the time
set showcmd       " Display incomplete commands

" Let's enable folding!
set foldenable
set foldmethod=syntax
set foldlevel=1

" Softabs, 2 spaces for Ruby <3
set backspace=2   " Backspace deletes like most programs in insert mode
set expandtab
set tabstop=2
set shiftwidth=2
set shiftround
set smartindent

" Use system clipboard
if $TMUX == ''
  set clipboard+=unnamed
endif

" Fileformat
set fileformat=unix
set fileformats=unix,dos

" Display extra whitespace
set list listchars=tab:»·,trail:·

" Disable the mouse
set mouse=c

" Make it obvious where 80 characters is,
" since a line should not contain more than that
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Splits and windows
set splitbelow
set splitright

" Enable spell check
set spell

" Showing syntax highlight group in statusline
function! SyntaxItem()
  return synIDattr(synID(line("."),col("."),1),"name")
endfunction

filetype plugin indent on
syntax on

" UI Settings
set wildmenu
set t_Co=256
set background=dark
colorscheme dracula
let g:dracula_italic = 1
let g:airline_theme = 'dracula'

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore"
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 1
endif


" May the force be with you
nnoremap <silent> <Left> :bprev<CR>
nnoremap <silent> <Right> :bnext<CR>
nnoremap <Up> :echo "Use k"<CR>
nnoremap <Down> :echo "Use j"<CR>

let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_javascript_checkers = ['standard']
autocmd bufwritepost *.js silent !standard % --format

" Override certain sections of airline
call airline#parts#define_function('syntaxitem','SyntaxItem')
function! AirlineInit()
  let g:airline_section_x = airline#section#create(['syntaxitem',' ','tagbar','filetype'])
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

" Set .axlsx to ruby
autocmd BufNewFile,BufRead *.xlsx.axlsx set syntax=ruby

" Add mapping for tagbar
nmap <F8> :TagbarToggle<CR>

set lazyredraw

" http://ideasintosoftware.com/vim-productivity-tips/
set relativenumber

" http://ideasintosoftware.com/history-is-a-tree/
set undofile
set undodir=~/.vim/undodir

" For startify - htps://github.com/mhinz/vim-startify
set viminfo='100,n$HOME/.vim/files/info/viminfo'
let g:startify_list_order = [
      \ ['   MRU'],           'files' ,
      \ ['   MRU '.getcwd()], 'dir',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ 'bundle/.*/doc',
      \ ]

let g:startify_change_to_dir          = 0
let g:startify_enable_special         = 0
let g:startify_files_number           = 8
let g:startify_session_autoload       = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence    = 1
let g:startify_update_oldfiles        = 1
let g:startify_use_env                = 1

let g:startify_custom_header = [
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▄▄█▀▀▀▀▀▀▄▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀▀░░░░░░░░░░░▀▀█▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀░░░░░░▄▄▄░░░░░░░░▄▀█▄░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░▀▀▄░░░░▄▀▀░░░█▄░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░▄█▀▀▀█▄░▄█▀▀▀█▄░▀▄░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░██░▀░██░██░▀░██░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░▀█████▀░▀█████▀░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░▄░░░░█░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░░██▀▀▀▀█░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░█░▄▀▄▄▄▀░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░░░░░░░░░▄█▀▀▀▀▄░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░█▄░░░░░░░░░░░░░░█▄█▄█▄█░░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░█▄░░░░░░░░░░░░▄▀█████▀░░░░▄▀░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░▄█▄░░░░░░░░░░░░░░░░░░░░░▄█▀░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░▄█▀▄░░▀▄▄░░▄▄░░░░░░░▀▀▀▄▄▀▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░▀░░░▀▄░░░▀▀▀██▄▄▄▄▄▄█▀▀░░░░▄▄░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█░░░░░░░▄█▀▄░▄▄▄░░░░▀██▀░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░█▄░░░░▄█▄▄▄█████▄▄▄▀▀░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▀▀▀█▀▀▀▀▀░▀██▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░▄▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░    Y  U   NO   VIM??   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \"░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░",
      \""
      \]

vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

" Detect fastlane config as ruby
au BufNewFile,BufRead *Fastfile set filetype=ruby
au BufNewFile,BufRead *Appfile set filetype=ruby

" http://www.devinrm.com/2016/02/16/ditching-ctrl-p/
" Fuzzy-find with fzf
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>

" Customize fzf
let g:fzf_layout = { 'down': '~19%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
