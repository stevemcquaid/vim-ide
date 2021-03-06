"" ==============
"  Initialization
"" ==============

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

" Wildmode options
" ----------------
set wildmenu
set wildmode=longest:full,full
set wildignore+=*.o,*.out,*.obj,*.rbc,*.rbo,*.class,*.gem
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz
set wildignore+=*.jpg,*.png,*.gif,*.jpeg,*.bmp
set wildignore+=*.hg,*.git,*.svn
set wildignore+=*.exe,*.dll
set wildignore+=*.pyc
set wildignore+=*.DS_Store


filetype plugin indent on

"  Filetype Association
"" ====================

au BufRead,BufNewFile *vimrc set foldmethod=marker

augroup MarkdownFiles " Instead of this Modulo file bullshit
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
augroup end

au BufWritePost ~/.bashrc !source %

"  Look and Feel
"" =============
" Basics / Misc
" -------------

" Used for saving git and hg commits
filetype on
filetype off

" Set to allow you to backspace while back past insert mode
set backspace=2

" Increase History
set history=999

" Enable numbers in the left column
set number

" Give context to where the cursor is positioned in a file
set scrolloff=14

" Use UTF-8 encoding
set encoding=utf-8 nobomb
"set enc=utf-8
"set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1

" Hide buffers after they are abandoned
set hidden

" Disable files that don't need to be created
set noswapfile
set nobackup
set nowb

" Auto Complete Menu
" set completeopt=noselect,menuone,preview

" Tabbing and Spaces
" ------------------
" Use 4 spaces instead of tabs
set tabstop=4
set shiftwidth=4
set expandtab

" Auto indent
set autoindent

" replace trailing whitespace and tabs with unicode characters
exec "set listchars=tab:\uBB\uBB,trail:\u2716,nbsp:~"
set list

" Persistent Undo
" ---------------
if v:version >= 703
    set undofile
    set undodir=~/.vim/tmp,~/.tmp,~/tmp,~/var/tmp,/tmp
endif

" Spelling / Typos
" ----------------
:command! WQ wq
:command! Wq wq
:command! W w
:command! Q q
"
" Open file and goto previous location
" ------------------------------------
autocmd BufReadPost *  if line("'\"") > 1 && line("'\"") <= line("$")
            \|     exe "normal! g`\""
            \|  endif

"" ==============
"  Plugin Settings
"" ===============
" Airline Settings
" ----------------
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
let g:bufferline_echo = 0
"let g:airline_theme = 'badwolf'
let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'


" Airline statusline settings
let g:airline_skip_empty_sections = 0
let g:airline_section_a = airline#section#create(['mode'])
"let g:airline_section_b = 'hey there'
"let g:airline_section_b = airline#section#create(['hunk', 'branch'])
let g:airline_section_c = airline#section#create(['%t'])

let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_section_y = airline#section#create(['ffenc'])
"let g:airline_section_z = airline#section#create(['%l'])
call airline#parts#define_raw('linenr', '%l')
call airline#parts#define_accent('linenr', 'bold')
call airline#parts#define_raw('maxlinenr', '%L')
call airline#parts#define_accent('maxlinenr', 'bold')

let g:airline_section_z = airline#section#create(['%3p%% ', g:airline_symbols.linenr, '', 'linenr', '/', 'maxlinenr'])

" function! AirlineStatusLineOverride(...)
"     "call airline#extensions#apply_left_override('SpaceVimPlugins', '')
"     " Alternatively, set the various w:airline_section variables
"     let w:airline_section_a = 'SpaceVimPluginManager'
"     let w:airline_section_b = ''
"     let w:airline_section_c = ''
"     "let w:airline_render_left = 1
"     "let w:airline_render_right = 0
" endfunction
" call airline#add_statusline_func('AirlineStatusLineOverride')
"
" function! MyOverride(...)
"     call g:airline:l.add_section('StatusLine' , ' all ')
"     "call a:l.add_section('StatusLine' , ' all ')
"     "call a:l.add_section('StatusLine' , ' all ')
"     "call a:l.add_section('StatusLine' , ' all ')
"     call g:airline:l.split()
"     call g:airline:l.add_section('Error', ' %p%%')
"     return l
" endfunction
" call airline#add_statusline_func('MyOverride')

" vim-airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"if !exists('g:airline_powerline_fonts')
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" let g:airline_left_sep          = '▶'
let g:airline_left_sep          = ''

let g:airline_left_alt_sep      = '»'

" let g:airline_right_sep         = '◀''
let g:airline_right_sep         = ''

let g:airline_right_alt_sep     = '«'
let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
let g:airline#extensions#readonly#symbol   = '⊘'
let g:airline#extensions#linecolumn#prefix = '¶'
let g:airline#extensions#paste#symbol      = 'ρ'
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
"else
    "let g:airline#extensions#tabline#left_sep = ''
    "let g:airline#extensions#tabline#left_alt_sep = ''

    "" powerline symbols
    "let g:airline_left_sep = ''
    "let g:airline_left_alt_sep = ''
    "let g:airline_right_sep = ''
    "let g:airline_right_alt_sep = ''
    "let g:airline_symbols.branch = ''
    "let g:airline_symbols.readonly = ''
    "let g:airline_symbols.linenr = ''
"endif

" Markdown Settings
" ----------------
let g:vim_markdown_folding_disabled = 1

" Vim Session Persist
" -------------------
let g:session_autosave = 1
let g:session_autoload = 1

" NERDTree
" --------

" General properties
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

" Syntastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Vim-go
" --------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "gofmt" "Explicited the formater plugin (gofmt, goimports, goreturn...)

let g:go_list_type = "quickfix"

" Show a list of interfaces which is implemented by the type under your cursor
au FileType go nmap <Leader>s <Plug>(go-implements)

" Show type info for the word under your cursor
au FileType go nmap <Leader>i <Plug>(go-info)

" Open the relevant Godoc for the word under the cursor
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

" Open the Godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)

" Run/build/test/coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" By default syntax-highlighting for Functions, Methods and Structs is disabled.
" Let's enable them!
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

"" ========
"  Mappings
"" ========
" Disable Q (Command Shell Mode)
" ------------------------------
nnoremap Q <nop>
nnoremap gq <nop>
nnoremap q: <nop>

" * No longer moves the cursor when hitting it the first time
" -----------------------------------------------------------
nmap * *Nzz
nmap # #Nzz

" Y y$ Fix
" --------
" Why the hell isn't this the normal behavior?
nnoremap Y y$

" Easy Window Switching
" ---------------------
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Space folds and unfolds
" -----------------------
nnoremap <Space> za
vnoremap <Space> za

" Zencoding
" ---------
" let g:user_zen_leader_key='<c-e>'
" let g:use_zen_complete_tag = 1

" Misc
" ----
imap jj <Esc>:redraw!<CR>:syntax sync fromstart<CR>

" Vimrc Toggle
" ------------
function! ToggleVimrc()
    if expand("%:p") =~ $MYVIMRC
        :bd
    else
        :vsp $MYVIMRC
    endif
endfunction
nmap <leader>v :call ToggleVimrc()<CR>

" Cheatsheet Toggle
" ------------
nmap <F2> :!pandoc ~/.vim/CHEATSHEET.md \| lynx -stdin<cr>:redraw!<cr>

" Markdown Preview Toggle
" ------------
nmap <F7> :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>

" NERDTreeToggle
" --------------
function! NERDTreeToggleOrFocus()
    if expand("%") =~ "NERD_tree"
        :NERDTreeTabsToggle
    else
        call NERDTreeFocus()
    endif
endfunction
nmap <leader>n :call NERDTreeToggleOrFocus()<CR>

" Quickfix list nav with C-n and C-m
" ----------------------------------
map <C-n> :cn<CR>
map <C-m> :cp<CR>

" Multipurpose Tab-key
" --------------------
" Taken from https://github.com/gregstallings/vimfiles/blob/master/vimrc
" Indent if at the beginning of a line, else do completion
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        if CanExpandSnippet() > 0
            return "\<C-r>=TriggerSnippet()\<cr>"
        else
            return "\<c-p>"
        endif
    endif
endfunction
"inoremap <tab> <c-r>=InsertTabWrapper()<cr>
"inoremap <s-tab> <c-n>
"inoremap <c-c> <C-r>=TriggerSnippet()<cr>

" Toggle Paste/No Paste
" --------------------
function! TogglePaste()
    if &paste
        :set nopaste
    else
        :set paste
    endif
endfunction
nmap <leader>p :call TogglePaste()<CR>


"  Performance Optimizations
"" =========================

" Fast terminal connections
set ttyfast

" Don't redraw when running macros
set lazyredraw

" Syntax optimazations
syntax sync minlines=256

"  Post Configurations
"" ===================
" Find local Vim files"
silent! source ~/.vimrc.local
silent! source ./.vimrc.local
" Remap mappings that get overwritten by plugins
set rtp+=~/.vim/after/
"" ==============
"
"
