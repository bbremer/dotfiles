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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" }}}

" Editing behaviour {{{
" tabs/indenting
" TODO: Language specific.
set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for indenting with '<<' and '>>'.
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


" TODO: After this.
" Filetype specific handling {{{
" only do this part when compiled with support for autocommands
if has("autocmd")
    augroup python_files "{{{
        au!

	" PEP8 compliance (set 1 tab = 4 chars explicitly, even if set
        " earlier, as it is important)
        autocmd filetype python setlocal textwidth=78
        autocmd filetype python set colorcolumn=80
	    autocmd filetype python match ErrorMsg '\%>80v.\+'

	" But disable autowrapping as it is super annoying
        autocmd filetype python setlocal formatoptions-=t

	" Change python folding to follow indents
	    autocmd filetype python set foldmethod=indent
    augroup end " }}}

    augroup readme_files "{{{
        au!
        autocmd BufRead,BufNewFile *.md,*.txt setlocal textwidth=80
    augroup end "}}}
endif
