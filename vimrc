filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

":filetype plugin indent on

"tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent

set encoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set cursorline
"set backspace=indent,eol,start

"auto indentation
":set smartindent

"search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"clear search
nnoremap <leader><space> :noh<cr>

"wrap options
set wrap
set textwidth=79
set formatoptions=qrn1
set linebreak

"split options
set splitright
set splitbelow


"color scheme
:colo wombat
":colo vividchalk

"file types
:au BufNewFile,BufRead *.as set filetype=actionscript
:au BufNewFile,BufRead *.haml setfiletype haml
:au BufNewFile,BufRead *.sass setfiletype sass
:au BufNewFile,BufRead *.mustache setfiletype mustache

"pydiction
filetype plugin on
left g:pydiction_location = '~/.vim/bundle/Pydiction/after/pydiction/complete-dict'
let g:pydiction_menu_height = 15


"autocomplete stuff
:filetype plugin indent on
:set ofu=syntaxcomplete#Complete

"line number
:set nu

" bind ctrl-l to hashrocket (=>")
imap <C-l> <Space>=><Space>"

"bind ctrl-k to convert word to symbol (:word)
imap <C-k> <C-o>b:<Esc>Ea
nmap <C-k> lbi:<Esc>E

"bind ctrl-j to jump to end of line in insert mode.
imap <C-j> <End>

"tab switching with alt-arrows
map <silent><C-Tab> :tabnext<CR>
map <silent><C-S-Tab> :tabprevious<CR>

"escape from insert mode
inoremap kj <Esc>

"Command-T settings:
let g:CommandTAcceptSelectionTabMap='<CR>'
let g:CommandTAcceptSelectionMap='<C-CR>'
"set leader
let mapleader=","

"quickly edit vimrc
nmap <leader>v :tabe $MYVIMRC<cr>

"set formater
set formatprg=par\ -w50
"format
nnoremap <leader>q gqip

"spliting window
nnoremap <leader>w <C-w>v<V-w>l
"NERDTree
nnoremap <leader>n :NERDTree<cr>

"align with Tabular
if exists(":Tabularize")
	nmap <Leader>a= :Tabularize /=<CR>
	vmap <Leader>a= :Tabularize /=<CR>
	nmap <Leader>a: :Tabularize /:<CR>
	vmap <Leader>a: :Tabularize /:<CR>
	nmap <Leader>al :Tabularize /
	vmap <Leader>al :Tabularize /

endif

"align columns
nmap <Leader>c :%!column -t<CR>

"indentation
vmap <A-Tab> >gv
vmap <A-S-Tab> <gv

"system copy paste
map <Leader>y "+y
map <Leader>p "+p
map <Leader><S-p> "+P

"jump to definition
map <Leader>jd <C-]>


" Source vimrc after saving
if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
endif
