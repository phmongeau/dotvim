".vimrc
" Author: Philippe Mongeau

" --------Preamble (Vundle)----------{{{
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'


Bundle 'garbas/vim-snipmate'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'wincent/Command-T'
Bundle 'ervandew/supertab'
Bundle 'phmongeau/vim-speeddating'
Bundle 'Shougo/neocomplcache'
Bundle 'scrooloose/nerdcommenter'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mattn/zencoding-vim'
Bundle 'phmongeau/vim-slime'
Bundle 'phmongeau/jekyll.vim'
Bundle 'tomtom/tlib_vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'jceb/vim-orgmode'
Bundle 'honza/snipmate-snippets'
Bundle 'sotte/vim-pep8'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-haml'
Bundle 'timcharper/textile.vim'
Bundle 'juvenn/mustache.vim'
Bundle 'tpope/vim-markdown'
Bundle 'vim-scripts/Conque-Shell'
Bundle 'reinh/vim-makegreen'
Bundle 'lambdalisue/nose.vim'
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
set listchars=tab:▸\ ,eol:¬
set wildmenu
"search options
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
"wrap options
set wrap
set formatoptions=qrn1
set linebreak
"}}}

" --------Status Line------------------{{{

if has('statusline')
	"filename
	set statusline=[%f%m%r]
	"current directory
	set statusline+=\ %.30{getcwd()}
	"git branch
	set statusline+=%=\ %{fugitive#statusline()}
	"file nav info
	set statusline+=\ %<%-14.(Line:\ %l/%L\ -%)
	"word count
	set statusline+=\ Words:\ %{WordCount()}
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
"set foldmethod=marker
set foldmethod=manual
"set foldlevelstart=99

"filtype specific:
augroup folds
	au!
	au FileType vim setlocal foldmethod=marker foldlevel=0
	au FileType python setlocal foldmethod=indent foldlevel=99
augroup END
"}}}

" --------Better navigation------------{{{
map j gj
map k gk

map H ^
map L $

" --- ctags ---
set tags=tags;$HOME
nnoremap gt <C-]>
"nnoremap ggt g<C-]>
nnoremap gwt <C-w><C-]>

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
augroup ftypes
	"clear the group
	autocmd!
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
augroup END
"}}}

"------Autocomplete Settings-----------{{{
:set ofu=syntaxcomplete#Complete

"Neocomplecache
let g:neocomplcache_enable_at_startup = 1
"}}}

"------Various plugins settings--------{{{
"Org-mode ---------{{{
let g:org_todo_keywords = [['TODO(t)', 'NEXT(n)', 'STARTED(s)', 'WAITING(w)', '|', 'DONE(d)', 'CANCELED(c)']]
let g:org_todo_keyword_faces = [['STARTED', [':foreground darkyellow', ':background NONE', ':decoration bold']], ['CANCELED', [':foreground grey', ':background NONE', ':decoration: bold']]]

let g:org_agenda_files = ['~/Documents/todo/todo.org']
"nnoremap <Leader>ac :split ~/Documents/todo/todo.org<CR>
"}}}

"Snipmate----------{{{
let g:snips_author='Philippe Mongeau'
let g:snips_trigger_key="<c-cr>"
"}}}

"MakeGreen---------{{{
map <C-t> :w\|:call MakeGreen()<cr>
"map <C-t> <Plug>MakeGreen
"}}}

"}}}

" --------------Leader-----------------{{{
let mapleader=","
let maplocalleader = "è"
"}}}

"-----------Custom mappings------------{{{
"Edit vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>et :vsplit ~/Documents/todo/todo.org<cr>

"edit files from same directory
cnoremap %% <C-r>=expand('%:h').'/'<cr>
map <leader>ee :edit %%

"switch between two last buffers
nnoremap <leader><leader> <C-^>


" ---Set Formater----{{{
	"set formatprg=fmt\ -w65
	"set formatprg=par\ -w65q
"set formatprg=format
"format
nnoremap <leader>q gggqG
"}}}

"spliting window
nmap <leader>v :vsplit %
nnoremap <leader>h :split<CR>

"NERDTree
nnoremap <leader>n :NERDTreeToggle %<cr>

"system copy paste
nnoremap <Leader>y "yy
nnoremap <Leader>p "+p
nnoremap <Leader><S-p> "+P

" remove highlight
nnoremap <leader>/ :noh<cr>

"Ack
nnoremap <Leader>ak :Ack

"write as sudo
cmap w!! %!sudo tee > /dev/null %

cnoreabbrev W w
cnoreabbrev Wq wq
cnoreabbrev WQ wq
cnoreabbrev Q q
cnoreabbrev qq bdelete %

"Uppercase current word
nnoremap <D-u> viw<S-u>e
inoremap <D-u> <esc>viw<S-u>ea

"Abbreviations
iabbrev _me Philippe Mongeau
iabbrev ssig ---<cr>    Philippe Mongeau
iabbrev blg http://phmongeau.github.com
iabbrev mblg [ph.mongeau](http://phmongeau.github.com)
iabbrev tblg "ph.mongeau":http://phmongeau.github.com
iabbrev mmail ph.mongeau@gmail.com

vnoremap v <esc><S-v>

noremap <F1> <NOP>

"Conque
let g:ConqueTerm_SendFileKey = '<F4>'
let g:ConqueTerm_SendVisKey = '<F5>'

"toggle inivsible chars visibility
nnoremap <leader>l :set list!<CR>

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

command! -range=% SoftWrap
            \ <line2>put _ |
            \ <line1>,<line2>g/.\+/ .;-/^$/ join |normal $x
"}}}

"-----Source vimrc after saving--------{{{
if has("autocmd")
	augroup vimrc
		autocmd! bufwritepost .vimrc source $MYVIMRC
	augroup END
endif
"}}}
