    " plugins expect bash - not fish, zsh, etc
    set shell=bash\ --login

    " Use Vim settings instead of Vi settings.
    set nocompatible
    filetype off

    " If you can't spell, tough.
    set nospell

    " Assume a dark background
    set background=dark

    " Clear Autocommands
    autocmd!

    " Let Vim look for settings in a file
    set modeline
    set modelines=5

    " If vimrc has been modified, re-source it for fast modifications
    autocmd! BufWritePost *vimrc source %

    " Set Leader
    let g:mapleader = ","

    filetype plugin indent on
    syntax on

    execute pathogen#infect()

    " NERDTree General properties
    let g:NERDTreeDirArrows=1
    let g:NERDTreeMinimalUI=1
    let g:NERDTreeIgnore=['\.o$', '\.pyc$', '\.php\~$']
    let g:NERDTreeWinSize = 25

      " Make sure that when NT root is changed, Vim's pwd is also updated
    let g:NERDTreeChDirMode = 2
    let g:NERDTreeShowLineNumbers = 1
    let g:NERDTreeAutoCenter = 1
    let g:NERDTreeShowHidden = 1

    " Open NERDTree on startup, when no file has been specified
    autocmd VimEnter * if !argc() | NERDTree | endif
    
    :command! WQ wq
    :command! Wq wq
    :command! W w
    :command! Q q

