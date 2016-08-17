set nu " set file numbers
set ai " activate auto indent
set si " activate smart indent

set mouse=a " show mouse cursor

au BufRead,BufNewFile *.ms set syntax=off expandtab smarttab shiftwidth=2 " set settings for mscript files

au BufRead,BufNewFile *.lisp set expandtab smarttab shiftwidth=2 " set settings for common-lisp files

set foldmethod=indent " enable folding of code blocks
set foldlevel=99 
                    "allow folding by pressing space
nnoremap <space> za
