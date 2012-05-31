" ~/.vimrc

set spell
set nocompatible
set backspace=start,indent,eol
" How many lines of history to remember
set history=1000
set cf
set ffs=unix,dos,mac
set modeline
set tabpagemax=50
" The commandbar height
set cmdheight=1
" Don't keep backups
set nobackup
set nowritebackup
set noswapfile
" Directory where backups are kept
"set backupdir=~/.vim.d/backup
set backupcopy=yes
" Always show current position
set ruler
set showcmd
set nolazyredraw
" shows matching brackets
set showmatch
set wrapscan
" Incremental search, starts search the file as you enter the search term
set incsearch
" Ignore case when searching
set ignorecase
set visualbell
set autoindent
set cindent
set smartindent
set nowrap
set softtabstop=2
set shiftwidth=2
set tabstop=4
set expandtab
set nosmarttab
set smartcase
set number
"set t_Co=256
" Highlight search
"set hlsearch

" always show tab pages
set showtabline=2

" Format the statusline
set laststatus=2
hi StatusLine ctermfg=cyan 
hi StatusLineNC cterm=none
set statusline=%F%m%r%y\ %w\ %=Line:\ %l/%L:%c
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\%{strftime(\"%d/%m/%y\ -\ %H:%M\")}
"set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

" Using pathogen to manage plugins, allows us to keep them as git submodule
call pathogen#infect()
" Enable syntax highlighting
syntax on
filetype on
filetype plugin indent on

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Color scheme stuff
set background=dark

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
colorscheme solarized

source ~/.vim/plugin/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 
