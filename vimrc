filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

:filetype plugin indent on
"---- Line Numbering ---- 
:set nu

set guioptions-=T
set laststatus=2
"tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent

set encoding=utf-8
set fileencoding=utf-8
set scrolloff=3
set showmode
set showcmd
set hidden
set cursorline

set switchbuf=useopen
"set autochdir

"Font
set guifont=Menlo:h11

if has('statusline')
	"filename
set statusline=%<%f\ %h%m%r
	"git branch
	set statusline+=%{fugitive#statusline()}
	"current directory
	set statusline+=\ [%{getcwd()}]
	"file nav info
	set statusline+=%=%-14.(Line:\ %l\ of\ %L\ [%p%%]\ -\ Col:\ %c%V%)
	"word count
	set statusline+=\ words:%{WordCount()}
endif

"search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch

"wrap options
set wrap
"set textwidth=79
set formatoptions=tqrn1
set linebreak

"-----Zen Coding-------"
"let g:user_zen_leader_key = '<c-e>'
imap <C-e> <C-y>
nmap <C-e> <C-y>
vmap <C-e> <C-y>
imap <C-e><C-e> <C-e>,
nmap <C-e><C-e> <C-e>,
vmap <C-e><C-e> <C-e>,

"------------------------
" Folding Settings
"------------------------
set foldmethod=indent
set foldlevel=99

nnoremap <Leader>f za

" --- Better navigation --- 
map j gj
map k gk

" Reselect visual block after adjusting indentation
vnoremap < <gv
vnoremap > >gv


" ---- Split Options ------- 
set splitright
set splitbelow

" ------ Color Scheme -------
let g:solarized_diffmode="high"
colo solarized
syntax enable
if has('gui_running')
	set background=light
else
set background=dark
endif

" ---- File Type Actions ----
au BufNewFile,BufRead *.as set filetype=actionscript
au BufNewFile,BufRead *.haml setfiletype haml
au BufNewFile,BufRead *.sass setfiletype sass
au BufNewFile,BufRead *.mustache setfiletype mustache
au BufReadCmd *.epub call zip#Browse(expand(""))

"----- Remove fugitive buffers ----
autocmd BufReadPost fugitive://* set bufhidden=delete

" ---- auto cd ---- 
"au BufEnter * cd %:p:h


" --- ctags ---
set tags=tags;/
nnoremap gt <C-]>

" ----- Pydiction ----- 
filetype plugin on
left g:pydiction_location = '~/.vim/bundle/Pydiction/after/pydiction/complete-dict'
let g:pydiction_menu_height = 15

" ------ Autocomplete Settings ------ 
:set ofu=syntaxcomplete#Complete

"------ Neocomplecache -------
let g:neocomplcache_enable_at_startup = 1

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
let g:CommandTAcceptSelectionTabMap='<C-CR>'
let g:CommandTAcceptSelectionMap='<CR>'

"Org-mode
let g:org_todo_keywords = [['TODO(t)', 'NEXT(n)', 'STARTED(s)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELED(c)']]
let g:org_todo_keyword_faces = [['STARTED', [':foreground darkyellow', ':background NONE', ':decoration bold']], ['CANCELED', [':foreground grey', ':background NONE', ':decoration: bold']]]

"Snipmate settings
let g:snips_author='Philippe Mongeau'
let g:snips_trigger_key="<c-cr>"

" ----- Map Leader ----
let mapleader=","

"quickly edit vimrc
nmap <leader>v :tabe $MYVIMRC<cr>

" --- Set Formater ----
	"set formatprg=fmt\ -w65
	"set equalprg=par\ -w65q
set formatprg=format
"format
nnoremap <leader>q gggqG


"spliting window
nnoremap <leader>w <C-w>v<V-w>l
"NERDTree
nnoremap <leader>n :NERDTreeToggle %<cr>

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
nmap <Leader>al :%!column -t<CR>

"indentation
vmap <A-Tab> >gv
vmap <A-S-Tab> <gv

"system copy paste
map <Leader>y "+y
map <Leader>p "+p
map <Leader><S-p> "+P


nnoremap <leader>/ :noh<cr>


"text bubling
nmap <D-S-Up> [e
nmap <D-S-Down> ]e
vmap <D-S-Up> [egv
vmap <D-S-Down> ]egv

" ------- Jekyll -------
let g:jekyll_path = "~/Sites/phmongeau.github.com"
let g:jekyll_post_suffix = "textile"
let g:jekyll_post_published = "false"
"let g:jekyll_post_created = "2011-05-24 10:00:00 -05:00"
let g:jekyll_post_date = "true"
let g:jekyll_post_timezone = "-5:00"

map <Leader>jn :JekyllPost<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""	Functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
nnoremap <silent> <Leader><Space> :call <SID>StripTrailingWhitespaces()<CR>

function! WordCount()
  let lnum = 1
  let n = 0
  while lnum <= line('$')
    let n = n + len(split(getline(lnum)))
    let lnum = lnum + 1
  endwhile
  return n
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Source vimrc after saving
if has("autocmd")
	autocmd! bufwritepost .vimrc source $MYVIMRC
endif
