"{{{Auto Commands

" Automatically cd into the directory that the file is in
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Perl shebang, warnings, strict, and html tag
   autocmd BufNewFile *.pl 0put =\"#!/usr/bin/perl\<nl>print \\"Content-Type: text/html\\n\\n\\";\<nl>\<nl>use strict;\<nl>use warnings;\<nl>\<nl>\"|$

" ASM Skeleton file
au BufNewFile *.asm 0r ~/.vim/asm.skel | let IndentStyle = "asm"

" C Skeleton file
au BufNewFile *.c 0r ~/.vim/c.skel | let IndentStyle = "c"

" HTML Skeleton file
au BufNewFile *.html 0r ~/.vim/html.skel | let IndentStyle = "html"

" XML Skeleton file
au BufNewFile *.xml 0r ~/.vim/xml.skel | let IndentStyle = "xml"

" MAKEFILE Skeleton file
au BufNewFile Makefile 0r ~/.vim/makefile.skel

"}}}

"{{{Settings

" Less vi like, more usefull
set nocompatible

" Shows what you are typing as a command.
set showcmd

" Folding Stuff
set foldmethod=marker

" Syntax highlighting
filetype on
filetype plugin indent on
syntax enable
set grepprg=grep\ -nH\ $*

" Tabs and indenting
set smarttab "affects how tab key works
set autoindent

" Use English for spellchecking
setlocal spell spelllang=en_gb
setlocal nospell "spellchecking off

" Sets how many lines of history VIM has to remember
set history=700

" Tab completion stuff
set wildmenu
set wildmode=list:longest,full

" Disable mouse support in console
set mouse=n

" Backspace over autoindent
set backspace=1

" Line Numbers
set number

" Search settings
set ignorecase " Ignore case
set smartcase " Smartcase
set incsearch " Incremental searching
set hlsearch " Highlight search results

" When I close a tab, remove the buffer
set nohidden

" Cursor highlighting
highlight MatchParen ctermbg=4

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set background=dark "     So
colorscheme desert "Beautiful

"Show position
set ruler

" Secure from modeline exploits
set modelines=0

" Highlight column 73
set colorcolumn=73

" }}}

"{{{ Mappings

" Create Blank Newlines and stay in Normal mode
nnoremap <silent> zj o<Esc>
nnoremap <silent> zk O<Esc>

" Space will toggle folds!
nnoremap <space> za

" Swap ; and :
nnoremap ; :
nnoremap : ;

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

map <F10> ;!cc %&&./a.out<enter>
map <F11> ;!perl %<enter>

"}}}

"{{{ Common spelling errors
iabbrev teh the
iabbrev recieved received
iabbrev recieve receive
iabbrev fro for
iabbrev yuo you
iabbrev htis this
iabbrev mispell misspell
iabbrev functiton function
iabbrev funciton function
iabbrev fucntion function
iabbrev funtion function
iabbrev erturn return
iabbrev retunr return
iabbrev reutrn return
iabbrev reutn return
iabbrev queyr query
iabbrev foreahc foreach
iabbrev forech foreach
iabbrev casue cause
iabbrev raed  read
iabbrev liek like
iabbrev leik like
iabbrev stupdi stupid
iabbrev mispell misspell
iabbrev haet hate
iabbrev heat hate
iabbrev like like
iabbrev leik like
iabbrev liej like
iabbrev leij like
iabbrev lije like

"}}}
