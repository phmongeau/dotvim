"set textwidth=79
setlocal shiftwidth=4
setlocal tabstop=4
setlocal expandtab
setlocal softtabstop=4
setlocal shiftround
setlocal smartindent

nnoremap <buffer> <F3> :!python %<CR>

iabbrev true True
iabbrev false False

compiler nose
