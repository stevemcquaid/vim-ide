"" Color Settings
" ================
"
"" Assume a dark background
set background=dark

" Color Settings
" --------------

" Enable syntax highlighting
syntax enable

" Set font and color scheme for Gvim
set guifont=Inconsolata\ for\ Powerline:h14
if has("gui_running")
    if has("gui_win32")
        set guifont=Consolas:h10:cANSI
    endif
else
    set t_Co=256
endif

try
    colorscheme badwolf
catch
endtry


