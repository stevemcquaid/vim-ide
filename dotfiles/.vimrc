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


