" ~/.vimrc
" References
" https://github.com/scrooloose/vimfiles/blob/master/vimrc

set nocompatible
call pathogen#infect()

set autoindent
set backspace=start,indent,eol
"set backupcopy=yes
"set backupdir=~/.vim.d/backup
set cf
set cmdheight=1
set cindent
set expandtab
set ffs=unix,dos,mac
set foldmethod=indent
set foldnestmax=3
set nofoldenable
set spell
set history=1000
set hlsearch
set incsearch
set ignorecase
set linebreak
"set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set modeline
set nowritebackup
set nobackup
set nolazyredraw
set noswapfile
set nowrap
set number
set nosmarttab
set ruler
set showcmd
set showmode
set showmatch
set smartcase
set smartindent
set softtabstop=4
set shiftwidth=4
set showtabline=2
set t_Co=256
set tabpagemax=50
set tabstop=4
set wrap
set wrapscan
set visualbell


" Format the statusline
set laststatus=2
hi StatusLine ctermfg=cyan 
hi StatusLineNC cterm=none
set statusline=%{fugitive#statusline()}    " Display current bracn
set statusline+=\ %F                       " Full filename
set statusline+=%m                         " modified
set statusline+=%r                         " Read only
set statusline+=%y                         " File type
set statusline+=%{&paste?'[paste]':''}     " Let me know if we are in paste mode
set statusline+=%=Line:
set statusline+=\ %l                       " current line
set statusline+=/%L                        " total lines
set statusline+=:%c                        " current column

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Enable syntax highlighting
syntax on
filetype on
filetype plugin indent on


" Solarized options
let g:solarized_termcolors=16
let g:solarized_termtrans=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast='normal'
let g:solarized_visiblity='normal'
" End Solarized Options

" Color scheme stuff
set background=dark
"set background=light
colorscheme solarized
" End color scheme

autocmd FileType php set omnifunc=phpcomplete#CompletePHP

source ~/.vim/plugin/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

" NERDTree settings
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=40
nnoremap <silent> <F1> :NERDTreeToggle<CR>
" End NERDTree settings

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=2
" End syntastic settings

" Tagbar settings
nnoremap <silent> <F2> :TagbarToggle<CR>
" End Tagbar settings


" Remap keys
nnoremap <C-L> :nohls<CR><C-L>   " ctrl + l will clear the highlighted search results
inoremap <C-L> <C-O>:nohls<CR>
