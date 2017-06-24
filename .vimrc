filetype off                  " required
set nu

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-powerline'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'altercation/vim-colors-solarized'
Plugin 'https://github.com/kien/ctrlp.vim'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tpope/vim-commentary'
Plugin 'jiangmiao/auto-pairs'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'sjl/badwolf'
Plugin 'vim-scripts/Conque-GDB'
Plugin 'morhetz/gruvbox'
"Plugin 'valloric/youcompleteme'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"
" " All of your Plugins must be added before the following line
call vundle#end()            " required
"filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line
syntax on
set encoding=utf-8
"colorscheme blackboard
set wrap
set fo=cqt
set wm=0
set t_Co=256
"set background=light
if has("autocmd")
      filetype plugin indent on
	  "autocmd FileType * set noexpandtab
endif

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned
set mps+=<:>
let g:html_indent_inctags = "html,body,head,tbody"
"let g:Powerline_symbols = 'fancy'
set textwidth=80
set laststatus=2
autocmd Filetype php setlocal ts=4 sw=4
nnoremap <F5> :buffers<CR>:buffer<Space>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
set tabstop=4
set shiftwidth=4
set termguicolors
"colorscheme solarized
"colorscheme PaperColor
set background=dark
"colorscheme badwolf
colorscheme gruvbox
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
set pastetoggle=<F2>
"nnoremap j gj
"nnoremap k gk

"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 6
let g:syntastic_loc_list_height = 6
let g:syntastic_aggregate_errors = 1
let g:syntastic_php_phpcs_args="--report=csv --standard=./vendor/mediawiki/mediawiki-codesniffer/MediaWiki"
let g:syntastic_python_checkers = ['python', 'flake8']
let g:syntastic_python_flake8_args = "--select F --ignore=F401,F403"
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_hotkey='<C-m>'
let mapleader=","
nnoremap <Leader>ct :ConqueTermTab zsh<CR>
set omnifunc=syntaxcomplete#Complete
set t_ut=
set mouse=a
nnoremap <Leader>ss :%s/\<<C-r><C-w>\>//gc<Left><Left>
nnoremap <Leader>nt :NERDTree<CR>
"Check for tags in this directory and above till found
set tags=tags;/
" Load CScope like tags - http://vim.wikia.com/wiki/Autoloading_Cscope_Database
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  endif
endfunction
au BufEnter /* call LoadCscope()
