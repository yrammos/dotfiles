" Configuration file for vim
set modelines=0		" CVE-2007-2438
set nomodeline

" Map jk to enter command mode
:ino jk <C-[>
:ino kj <C-[>

colorscheme Monokai-Dark

" Normally we use vim-extensions. If you want true vi-compatibility
" remove change the following statements
set nocompatible	" Use Vim defaults instead of 100% vi compatibility
set backspace=2		" more powerful backspacing

syntax on

set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler               " show the cursor position
syntax on               " syntax highlighting
set number		" turn on line numbering
set hlsearch            " highlight the last searched term
set smartcase		" Smart case matching
set ignorecase		" Case-insensitive matching
set showmatch		" Show matching brackets
set showcmd		" Show (partial) command in status line
set scrolloff=5		" At least 5 lines above/below
set undolevels=1000	" 1000 undos
filetype plugin on      " Use the file type plugins
set incsearch		" Incremental search
set wildmenu		" Wild menu
set wildmode=list:longest,full
set whichwrap=b,s,<,>,[,]	" Traverse line breaks with 'arrow keys'
:map j gj
:map k gk
" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

set runtimepath+=/usr/local/share/lilypond/2.16.2/vim
