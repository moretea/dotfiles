call pathogen#infect()

set modeline   " Respect other people's options (when a modeline is present)
set encoding=utf-8 " Use UTF-8 (8-bit variable width Unicode)

" indenting options
set autoindent  " Keep the indent level when hitting Return
set smartindent  " Use smart indenting (mostly useful for C/C++ files)
set cindent  " Don't indent Python really poorly
" that don't have a modeline present, especially Python files.
set fo=tcoqan  " Options for formatting text (i.e. for use with gq)
set expandtab     "soft tabs
set tabstop=2     "set tabstops
set shiftwidth=2  "set shiftwidth
set softtabstop=2 "delete this many spaces upon deleting soft tab

set nobackup " don't litter directories with swap files

" UI stuff
set showmatch  " Show matching parens as they come up
set ruler  " Show the column number in the status bar
set incsearch  " Find as you type
set lz   " Don't redraw the screen in the middle of executing macros
set nohlsearch  " Highlighting search terms is _really_ annoying
behave xterm  " Just in case...
set wrap  " Display files with word wrap, but don't actually insert newlines
" (Set by default)... so lines don't go off edge
set lbr   " Wrap only at word boundaries (default is at any character)
syntax enable  " Who wouldn't want syntax highlighting?
syntax sync fromstart " always render syntax from the beginning of the file

" Only allow folds that are manually set
set foldmethod=manual

" Make our folds look like how they were when we exited vim last time.
set viminfo=s1,<1024,'1024,/1024,:1024,@1024,c,f1,%,n~/.viminfo
autocmd BufReadPost *
\ if expand("<afile>:p:h") !=? $TEMP |
\   if line("'\"") > 0 && line("'\"") <= line("$") |
\     exe "normal g`\"" |
\     let b:doopenfold = 1 |
\   endif |
\ endif
" Need to postpone using "zv" until after reading the modelines
autocmd BufWinEnter *
\ if exists("b:doopenfold") |
\   unlet b:doopenfold |
\   exe "normal zv" |
\ endif

set nocompatible            " Don't act like SysV vi
set shell=/bin/bash         " Use this shell to execute commands
filetype plugin indent on   " ability to run different vimrcs on different filetypes
set autoread                " When a file has been detected to have been changed outside of Vim and
              " it has not been changed inside of Vim, automatically read it again.
set mouse=a                 " Have mouse operate in all modes -- disable mouse by holding the shift key
set ttyfast                 " Tell vim to optimize for a fast terminal; will be on by
              " default if your $TERM is xterm or screen, but could be
              " turned off if you use a weird terminal (e.g. 'screen-bce').
              " Set 'nottyfast' for slow SSH connections.
set history=50
set showmode                    " show what mode (e.g. INSERT) you're in
set showcmd                     " Show (partial) command in status line
set backspace=indent,eol,start  " explicitly makes the backspace work when at the beginning of a line
nmap <C-N><C-N> :set invnumber <CR> " Press Ctrl-N twice to toggle line numbers in the left margin

"splits
set wmh=0 " allow splits with 0 lines open
map <C-J> <C-W>j<C-W>_ " Hit C-j to move the current split down and maximize it
map <C-K> <C-W>k<C-W>_ " Hit C-k to move the current split up and maximize it

" cycling through tabs
map <C-H> <C-PageUp>
map <C-L> <C-PageDown>
imap <C-H> <C-PageUp>
imap <C-L> <C-PageDown>

set title           " sets title of terminal in menubar to that of file currently being edited
set ignorecase      " perform case-insensitive searches...
set smartcase       " ... unless there are capitalized characters in the search pattern
set mousehide       " hide the mouse when editing
set exrc            " eliminates the possibility of another .exrc getting confused with mine on multi-user systems
set bg=light        "this almost always looks better -- take this out or set it to dark if things look funny

" for common typos
command! Q quit
command! W write
command! Wq wq
cabbrev Set <c-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'set' : 'Set')<CR>

" Nerd tree
let g:nerdtree_tabs_open_on_console_startup=1
set showcmd
let mapleader = ","
map <Leader>n <plug>NERDTreeTabsToggle<CR>
