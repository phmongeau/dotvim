".vimrc
" Author: Philippe Mongeau

" --------Preamble (Pathogen)----------{{{

filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

" }}}

" --------Basic options----------------{{{
set encoding=utf-8
set fileencoding=utf-8
set autoindent
set showmode
set showcmd
set cursorline
filetype plugin indent on
set number
set guioptions-=T
set laststatus=2
set scrolloff=3
set hidden
set tabstop=4
set shiftwidth=4
set softtabstop=4
set noexpandtab
set smartindent
set switchbuf=useopen
set guifont=Menlo:h11
set wildmenu
"search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"wrap options
set wrap
set formatoptions=tqrn1
set linebreak
"}}}

" --------Status Line------------------{{{
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
"}}}

"-----Zen Coding-----------------------{{{
"let g:user_zen_leader_key = '<c-e>'
imap <C-e> <C-y>
nmap <C-e> <C-y>
vmap <C-e> <C-y>
imap <C-e><C-e> <C-e>,
nmap <C-e><C-e> <C-e>,
vmap <C-e><C-e> <C-e>,
"}}}

"---------Folding Settings-------------{{{
"set foldmethod=indent
set foldmethod=marker
set foldlevelstart=0
"}}}

" --------Better navigation------------{{{
map j gj
map k gk

map H ^
map L $

" --- ctags ---
set tags=tags;/
nnoremap gt <C-]>
nnoremap ggt g<C-]>

"text bubling
nmap <D-S-Up> [e
nmap <D-S-Down> ]e
vmap <D-S-Up> [egv
vmap <D-S-Down> ]egv

" Reselect visual block after adjusting indentation
vnoremap < <gv
vnoremap > >gv
"tab switching with alt-arrows
map <silent><C-Tab> :tabnext<CR>
map <silent><C-S-Tab> :tabprevious<CR>
"}}}

"----Split Options---------------------{{{
set splitright
set splitbelow
"}}}

"------Color Scheme--------------------{{{
let g:solarized_diffmode="high"
colo solarized
syntax enable
if has('gui_running')
	set background=light
else
set background=dark
endif
"}}}

"----File Type Actions-----------------{{{
"as3
au BufNewFile,BufRead *.as set filetype=actionscript
"haml
au BufNewFile,BufRead *.haml setfiletype haml
"sass
au BufNewFile,BufRead *.sass setfiletype sass
"mustache
au BufNewFile,BufRead *.mustache setfiletype mustache
"epub
au BufReadCmd *.epub call zip#Browse(expand(""))

"Remove fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete
"}}}

"------Autocomplete Settings-----------{{{
:set ofu=syntaxcomplete#Complete

"Neocomplecache
let g:neocomplcache_enable_at_startup = 1
"}}}

"------Various plugins settings--------{{{
"Command-T---------{{{
let g:CommandTAcceptSelectionTabMap='<C-CR>'
"}}}

"Org-mode ---------{{{
let g:org_todo_keywords = [['TODO(t)', 'NEXT(n)', 'STARTED(s)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELED(c)']]
let g:org_todo_keyword_faces = [['STARTED', [':foreground darkyellow', ':background NONE', ':decoration bold']], ['CANCELED', [':foreground grey', ':background NONE', ':decoration: bold']]]

let g:org_agenda_files = ['~/Documents/todo/todo.org']
nnoremap <Leader>ac :split ~/Documents/todo/todo.org<CR>
"}}}

"Snipmate----------{{{
let g:snips_author='Philippe Mongeau'
let g:snips_trigger_key="<c-cr>"
"}}}

"}}}

" --------------Leader-----------------{{{
let mapleader=","
let maplocalleader = "è"
"}}}

"-----------Custom mappings------------{{{
"Edit vimrc
nmap <leader>v :vsplit $MYVIMRC<cr>

" ---Set Formater----{{{
	"set formatprg=fmt\ -w65
	"set equalprg=par\ -w65q
set formatprg=format
"format
nnoremap <leader>q gggqG
"}}}

"spliting window
nnoremap <leader>w :vsplit<CR>

"NERDTree
nnoremap <leader>n :NERDTreeToggle %<cr>

"align columns
nmap <Leader>al :%!column -t<CR>

"system copy paste
map <Leader>y "yy
map <Leader>p "+p
map <Leader><S-p> "+P

" remove highlight
nnoremap <leader>/ :noh<cr>

"Ack
nnoremap <Leader>ak :Ack 

"write as sudo
cmap w!! %!sudo tee > /dev/null %

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq

" ------- Jekyll ------- {{{{
let g:jekyll_path = "~/Sites/phmongeau.github.com"
let g:jekyll_post_suffix = "textile"
let g:jekyll_post_published = "false"
"let g:jekyll_post_created = "2011-05-24 10:00:00 -05:00"
let g:jekyll_post_date = "true"
let g:jekyll_post_timezone = "-5:00"

map <Leader>jn :JekyllPost<CR>
"}}}

"}}}

"-------------Functions----------------{{{
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
"}}}

"-----Source vimrc after saving--------{{{
if has("autocmd")
	autocmd! bufwritepost .vimrc source $MYVIMRC
endif
"}}}
