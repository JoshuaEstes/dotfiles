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
set cm=blowfish
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
" 0: Never
" 1: Only if there are two or more tabs
" 2: Always
set showtabline=2
set t_Co=256
set tabpagemax=50
set tabstop=4
"set wrap
set wrapscan
set visualbell

if exists('&relativenumber')
  set relativenumber
endif

" Format the statusline
set laststatus=2
hi StatusLine ctermfg=cyan 
hi StatusLineNC cterm=none
set statusline=%{fugitive#statusline()}                     " Display current bracn
set statusline+=\ %F                                        " Full filename
set statusline+=%m                                          " modified
set statusline+=%r                                          " Read only
set statusline+=%y                                          " File type
set statusline+=%{&paste?'[paste]':''}                      " Let me know if we are in paste mode
set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " File Errors/Warnings
set statusline+=%=Line:
set statusline+=\ %l                                        " current line
set statusline+=/%L                                         " total lines
set statusline+=:%c                                         " current column

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Open NERDTree if no files are selected
autocmd vimenter * if !argc() | NERDTree | endif

" Enable syntax highlighting
syntax on
filetype plugin indent on
au BufNewFile,BufRead *.twig set filetype=htmljinja

" Autocompletion for different languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" neocomplecache options
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_enable_auto_delimiter = 1
"let g:neocomplcache_enable_auto_select = 0
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
" end neocomplcache

" Solarized options
let g:solarized_termcolors=16
let g:solarized_termtrans=1
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

" NERDTree settings
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=40
nnoremap <silent> <F2> :NERDTreeToggle<CR>
" End NERDTree settings

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=2
let g:syntastic_phpcs_conf="--standard=$HOME/.vim/standards/php.xml"
" End syntastic settings

" Tagbar settings
nnoremap <silent> <F3> :TagbarToggle<CR>
" End Tagbar settings

" ultisnips settings
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsListSnippets="<F4>"
" end ultisnips settings

" Remap keys
nnoremap <C-L> :nohls<CR><C-L>   " ctrl + l will clear the highlighted search results
inoremap <C-L> <C-O>:nohls<CR>

" MAP THOSE F KEYS!
" Generate ctags for this project ( see the make-tags script in the bin
" directory)
nnoremap <F5> :!make-tags<CR>
nnoremap <silent> <F11> :bp<CR> " Previous Buffer
nnoremap <silent> <F12> :bn<CR> " Next Buffer
nnoremap <silent> <S-F11> :tabp<CR> " Previous Tab
nnoremap <silent> <S-F12> :tabn<CR> " Next Tab

" vim-repeat
silent! call repeat#set("\surround.vim", v:count)

" Disable up, down, left, right keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Tabularize key mappings
nnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a> :Tabularize /=><CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
" end Tabularize key mappings
"
