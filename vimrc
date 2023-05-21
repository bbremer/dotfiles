" bbremer's personal preference .vimrc file.
"
" To start vim without using this .vimrc file, use:
"     vim -u NORC

" To start vim without loading any .vimrc or plugins, use:
"     vim -u NONE

" Vundle {{{
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins on GitHub repo
Plugin 'ycm-core/YouCompleteMe'
Plugin 'dense-analysis/ale'
Plugin 'nvie/vim-flake8'
Plugin 'arcticicestudio/nord-vim'
Plugin 'rust-lang/rust.vim'
Plugin 'fatih/vim-go'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Editing behaviour {{{
" tabs/indenting
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftround                  " round to multiple of shiftwidth when indenting with '<' and '>'
set autoindent                  " new lines inherit indentation of previous lines.
set copyindent                  " copy the previous indentation on autoindenting

" search
set hlsearch                    " highlight search terms
set ignorecase                  " ignore case when searching
set incsearch                   " show search matches as you type
set backspace=indent,eol,start  " allow backspacing over everything in insert mode

" text
set showmatch                   " set show matching parenthesis
set wrap                        " wrap lines
set linebreak                   " wrap entire words
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)
syntax enable                   " Syntax highlighting.
set clipboard=unnamed           " normal OS clipboard interaction
" set list                      " TODO: Map this.

" UI
set showcmd                     " show cmd being typed
set showmode                    " always show what mode we're currently editing in
set number                      " always show line numbers
set ruler                       " show cursor row and column
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set laststatus=2                " tell VIM to always put a status line in, even
                                "    if there is only one window
set virtualedit=all             " allow the cursor to go in to "invalid" places
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set noerrorbells                " disable beep on errors
set termguicolors               " needed for nord
silent! colorscheme nord        " change vim theme to nord


" files
set fileformats="unix,dos,mac"
set shortmess+=I                " hide the launch screen
set autoread                    " automatically reload files changed outside of Vim
set noswapfile                  " disable swap file

" speed
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50
set lazyredraw                  " don't update the display while executing macros

" encoding
set termencoding=utf-8
set encoding=utf-8

" command mapping
inoremap jk <ESC>
" }}}

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
