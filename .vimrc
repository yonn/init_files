set nu " set file numbers
set ai " activate auto indent
set si " activate smart indent

set hlsearch " highlight search entries

set mouse=a " show mouse cursor

au BufRead,BufNewFile *.ell set syntax=off expandtab smarttab shiftwidth=2 " set settings for electrum files

au BufRead,BufNewFile *.lisp set expandtab smarttab shiftwidth=2 " set settings for common-lisp files

au BufRead,BufNewFile *.op set syntax=off expandtab smarttab shiftwidth=2 " set settings for opal files

set foldmethod=indent " enable folding of code blocks
set foldlevel=99

" allow folding by pressing space
nnoremap <space> za

" Open buffer list and prompt for buffer
nnoremap gb :ls<CR>:b<Space>

" set cursor shapes by mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
