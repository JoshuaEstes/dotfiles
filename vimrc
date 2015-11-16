let g:vdebug_options={}
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
"Plugin 'Valloric/YouCompleteMe'
" Do not use enough
"Plugin 'jlanzarotta/bufexplorer', {'name': 'bufexplorer'}
"Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular.git'
Plugin 'SirVer/ultisnips'
Plugin 'https://github.com/altercation/vim-colors-solarized.git', {'name': 'vim-colors-solarized'}
Plugin 'https://github.com/tpope/vim-fugitive.git', {'name': 'vim-fugitive'}
"Plugin 'https://github.com/bling/vim-airline.git', {'name': 'vim-airline'}
"Plugin 'https://github.com/rodjek/vim-puppet.git', {'name': 'vim-puppet'}
"Plugin 'https://github.com/evidens/vim-twig.git', {'name': 'vim-twig'}
Plugin 'https://github.com/jamessan/vim-gnupg.git', {'name': 'vim-gnupg'}
Plugin 'https://github.com/joonty/vdebug.git', {'name': 'vdebug'}
Plugin 'https://github.com/editorconfig/editorconfig-vim.git', {'name': 'editorconfig'}
call vundle#end()
filetype plugin indent on

set autoindent
"indent	allow backspacing over autoindent
"eol	allow backspacing over line breaks (join lines)
"start	allow backspacing over the start of insert; CTRL-W and CTRL-U
"         stop once at the start of insert.
set backspace=start,indent,eol "allow backspacing over everything in insert mode
"set backupcopy=yes
"set backupdir=~/.vim.d/backup
set cf
set cm=blowfish
set cmdheight=1
set cindent
set encoding=utf-8
set fileencodings=utf-8
set expandtab " Expand tabs to spaces
set ffs=unix,mac,dos
set foldmethod=indent "fold based on indent
set foldnestmax=3 "deepest fold is 3 levels
set nofoldenable "dont fold by default
set spell
"set hidden "hide buffers when not displayed
set history=200 "store lots of :cmdline history
set hlsearch "hilight searches by default
set incsearch "find the next match as we type the search
set ignorecase
set linebreak
"set list
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set modeline
set nowritebackup
set nobackup
set nolazyredraw
set noswapfile
set nowrap "never wrap lines
set number "show line numbers
set nosmarttab
set ruler
set showcmd "show incomplete cmds down the bottom
set showmode "show current mode down the bottom
set showmatch
set smartcase
set smartindent
set softtabstop=4
set shiftwidth=4
" 0: Never
" 1: Only if there are two or more tabs
" 2: Always
set showtabline=2
set t_Co=256 "tell the term has 256 colors
set tabpagemax=50
set tabstop=4
"set wrap
set wrapscan
set visualbell
set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

if exists('&relativenumber')
  set relativenumber
endif

" Format the statusline
set laststatus=2
"hi StatusLine ctermfg=cyan
"hi StatusLineNC cterm=none
"set statusline=%{fugitive#statusline()}                     " Display current bracn
"set statusline+=\ %F                                        " Full filename
"set statusline+=%m                                          " modified
"set statusline+=%r                                          " Read only
"set statusline+=%y                                          " File type
"set statusline+=%{&paste?'[paste]':''}                      " Let me know if we are in paste mode
"set statusline+=%#warningmsg#%{SyntasticStatuslineFlag()}%* " File Errors/Warnings
"set statusline+=%=Line:
"set statusline+=\ %l                                        " current line
"set statusline+=/%L                                         " total lines
"set statusline+=:%c                                         " current column
" End statusline format

" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Enable syntax highlighting
syntax on
au BufNewFile,BufRead *.xml.dist set filetype=xml
au BufNewFile,BufRead *.yml.dist set filetype=yaml
"au BufNewFile,BufRead *.twig set filetype=twig
au BufNewFile,BufRead *.twig set filetype=htmljinja
au BufNewFile,BufRead *.md,*.txt set filetype=markdown

" Autocompletion for different languages
set omnifunc=syntaxcomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
set completeopt-=preview

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

" BuffExplorer
"nnoremap <f1> :BufExplorerHorizontalSplit<cr>
" end

" NERDTree settings
" Open NERDTree if no files are selected
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" I do not use a mouse
"let g:NERDTreeMouseMode=2
let g:NERDTreeWinSize=40 " default is 31
" ctrl+n opens NerdTree
map <C-n> :NERDTreeToggle<CR>
" Closes NerdTree if trying to quit vim and this is the only window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" End NERDTree settings

" Syntastic settings
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq=0
let g:syntastic_check_on_open=1
let g:syntastic_auto_loc_list=2
let g:syntastic_php_checkers=['php']
"let g:syntastic_php_checkers=['php', 'phpmd', 'phpcs']
"let g:syntastic_php_phpcs_args="-n --standard=PSR1,PSR2 --report=full"
"let g:syntastic_php_phpmd_post_args="text cleancode,codesize,design,naming,unusedcode"
" End syntastic settings

" ultisnips settings
"let g:UltiSnipsUsePythonVersion = 2
"let g:UltiSnipsListSnippets="<F4>"
let g:UltiSnipsExpandTrigger="<S-CR>"
"let g:UltiSnipsJumpForwardTrigger="<S-Tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" end ultisnips settings

" Tabularize key mappings
nnoremap <Leader>a= :Tabularize /=<CR>
nnoremap <Leader>a> :Tabularize /=><CR>
nnoremap <Leader>a: :Tabularize /:\zs<CR>
" end Tabularize key mappings

" YouCompleteMe
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
" end YouCompleteMe

" GnuPG
let g:GPGPreferArmor=1
let g:GPGPreferSign=1
"autocmd User GnuPG set updatetime=60000 " milliseconds
"autocmd User GnuPG set foldmethod=marker
"autocmd User GnuPG set foldclose=all
"autocmd User GnuPG set foldopen=insert
"autocmd CursorHold *.\(gpg\) quit
" end GnuPG

" airline
let g:airline#extensions#tabline#enabled = 1
" end airline

" easytags
set tags=./.tags;
let g:easytags_file='./.tags'
let g:easytags_dynamic_files=1
" end easytags

" vdebug
let g:vdebug_options["path_maps"] = {"/var/www/pi":"/Users/jestes/Code/Pardot/pardot"}
" end vdebug

" Remap keys
" Remap leader key (default `\`) to <SPACE>
let mapleader = ','
" ctrl + l will clear the highlighted search results
nnoremap <C-L> :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>
" jk remaps to ESC key, when in insert mode, type quickly
inoremap jk <ESC>

" In normal mode map tab to buffer next
nmap <silent> <Tab> :bn<CR>
" In normal mode map shift + tab to previous buffer
nmap <silent> <S-Tab> :bp<CR>
"nnoremap <silent> <F11> :bp<CR> " Previous Buffer
"nnoremap <silent> <F12> :bn<CR> " Next Buffer
"nnoremap <silent> <S-F11> :tabp<CR> " Previous Tab
"nnoremap <silent> <S-F12> :tabn<CR> " Next Tab

" Disable up, down, left, right keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
nnoremap j gj
nnoremap k gk
