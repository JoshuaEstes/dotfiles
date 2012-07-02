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
set showtabline=4
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
set statusline=%{fugitive#statusline()}    " Display current bracn
set statusline+=\ %F                       " Full filename
set statusline+=%m                         " modified
set statusline+=%r                         " Read only
set statusline+=%y                         " File type
set statusline+=%{&paste?'[paste]':''}     " Let me know if we are in paste mode
set statusline+=%{SyntasticStatuslineFlag()}
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
au BufNewFile,BufRead *.html.twig set filetype=html


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

" Autocompletion for different languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

source ~/.vim/plugin/php-doc.vim 
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i 
nnoremap <C-P> :call PhpDocSingle()<CR> 
vnoremap <C-P> :call PhpDocRange()<CR> 

" NERDTree settings
let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=40
nnoremap <silent> <F2> :NERDTreeToggle<CR>
" End NERDTree settings

" Syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=2
let g:syntastic_phpcs_conf="--standard=$HOME/.vim/standards/php.xmla"
" End syntastic settings

" Tagbar settings
nnoremap <silent> <F3> :TagbarToggle<CR>
" End Tagbar settings

" ultisnips settings
let g:UltiSnipsListSnippets="<F4>"
" end ultisnips settings

" Remap keys
nnoremap <C-L> :nohls<CR><C-L>   " ctrl + l will clear the highlighted search results
inoremap <C-L> <C-O>:nohls<CR>

" MAP THOSE F KEYS!
" Generate ctags for this project ( see the make-tags script in the bin
" directory)
nnoremap <F5> :!make-tags<CR>
nnoremap <silent> <F11> :bn<CR> " Next Buffer
nnoremap <silent> <F12> :bp<CR> " Previous Buffer
nnoremap <silent> <S-F11> :tabn<CR> " Next Tab
nnoremap <silent> <S-F12> :tabp<CR> " Previous Tab

