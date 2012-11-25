"set textwidth=79
setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab
setlocal softtabstop=4
setlocal shiftround
setlocal smartindent
" setlocal omnifunc=pythoncomplete#CompleteTags

nnoremap <buffer> <F3> :!python %<CR>

iabbrev <buffer> true True
iabbrev <buffer> false False

compiler nose

