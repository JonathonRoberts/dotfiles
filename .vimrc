"{{{Auto Commands

" Automatically cd into the directory that the file is in
au BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
au BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Perl shebang, warnings, strict, and html tag
au BufNewFile *.pl 0put =\"#!/usr/bin/perl\<nl>print \\"Content-Type: text/html\\n\\n\\";\<nl>\<nl>use strict;\<nl>use warnings;\<nl>\<nl>\"|$

" ASM Skeleton file
au BufNewFile *.asm 0r ~/.vim/asm.skel | let IndentStyle = "asm"

" C Skeleton file
au BufNewFile *.c 0r ~/.vim/c.skel | let IndentStyle = "c"

" HTML Skeleton file
au BufNewFile *.html 0r ~/.vim/html.skel | let IndentStyle = "html"

" XML Skeleton file
au BufNewFile *.xml 0r ~/.vim/xml.skel | let IndentStyle = "xml"

" Makefile Skeleton file
au BufNewFile Makefile 0r ~/.vim/makefile.skel
"}}}
"{{{Settings

" Functionality
set nocompatible	" Enable VIM features
set foldmethod=marker	" Folding Stuff
set history=700		" Sets how many lines of history VIM has to remember
set modelines=0		" Secure from modeline exploits
set mouse=n " Disable mouse support in console

" Display Settings
set background=dark	"     So
colorscheme desert	"Beautiful
" Cursor highlighting
highlight MatchParen ctermbg=4
set number		" Line Numbers
set ruler		"Show position
set colorcolumn=73	" Highlight column 73
set nohidden		" When I close a tab, remove the buffer

" Search settings
set ignorecase	" Ignore case
set smartcase	" Smartcase
set incsearch	" Incremental searching
set hlsearch	" Highlight search results

" Syntax highlighting
filetype on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Tabs and indenting
set smarttab	"affects how tab key works
set autoindent
set backspace=1	"Backspace over autoindent

" Ctrl-N Completion
set wildmenu
set wildmode=list:longest,full

" Use English for spellchecking
setlocal spell spelllang=en_gb
setlocal nospell	"spellchecking off

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
" }}}
"{{{ Mappings

" Space will toggle folds
nnoremap <space> za

" Per language mappings
autocmd FileType c map <buffer> <F5> : !make<enter>
autocmd FileType c map <buffer> <F9> : !make -C ../<enter>
autocmd FileType c map <buffer> <F10> : !make -C ../ qemu <enter>
autocmd FileType c map <buffer> <F11> : !make -C ../ qemu-gdb <enter>
autocmd FileType c map <buffer> <F12> : !gdb<enter>

autocmd FileType perl map <buffer> <F5> :!perl %<enter>

" :W saves the file with elevated privileges
command W w !doas tee % > /dev/null
"command W w !sudo tee % > /dev/null

" Swap ; and :
"nnoremap ; :
"nnoremap : ;
"}}}
